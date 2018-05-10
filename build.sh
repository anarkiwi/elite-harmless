#!/usr/bin/sh

# "Elite" C64 disassembly / "Elite DX", cc0 2018, see LICENSE.txt
# "Elite" is copyright / trademark David Braben & Ian Bell, All Rights Reserved
# <github.com/Kroc/EliteDX>
#===============================================================================

# stop further processing on any error
set -e

echo "building Elite DX:"
echo


ca65="./bin/cc65/bin/ca65 --target c64 --debug-info \
        --feature leading_dot_in_identifiers"
ld65="./bin/cc65/bin/ld65"
mkd64="./bin/mkd64/bin/mkd64"
encrypt="python3 build/encrypt.py"

echo "* building loader:"

echo "- assemble 'loader_stage0.asm'"
$ca65 -o build/loader_stage0.o      src/loader_stage0.asm
echo "- assemble 'loader_stage1.asm'"
$ca65 -o build/loader_stage1.o      src/loader_stage1.asm
echo "- assemble 'loader_stage2.asm'"
$ca65 -o build/loader_stage2.o      src/loader_stage2.asm
echo "- assemble 'loader_stage3.asm'"
$ca65 -o build/loader_stage3.o      src/loader_stage3.asm

# encrypt a block of Elite data

echo "- assemble 'elite_4000.asm'"
$ca65 -o build/elite_4000.o src/elite_4000.asm
# simply convert this to a binary as-is
echo "-     link 'elite_4000.bin'"
$ld65 -C build/gma4_bin.cfg -o build/elite_4000.bin build/elite_4000.o
# run the binary for the encrypt script, which will spit out an assembler file,
# this gets included in the relevant position by the stage 4 loader (GMA4.PRG)
echo "-  encrypt 'elite_4000.bin'"
$encrypt build/elite_4000.bin build/elite_4000.s

echo "- assemble 'loader_stage4_code.asm'"
$ca65 -o build/loader_stage4_code.o src/loader_stage4_code.asm
echo "- assemble 'loader_stage4_data.asm'"
$ca65 -o build/loader_stage4_data.o src/loader_stage4_data.asm
echo "- assemble 'gma5.asm'"
$ca65 -o build/gma5.o               src/gma5.asm
echo "- assemble 'gma6.asm'"
$ca65 -o build/gma6.o               src/gma6.asm

# the stage 0 loader is what gets loaded by `LOAD"*",8,1`
# its only purpose is to hijack BASIC and load the next stage
echo "-     link 'firebird.prg'"
$ld65 -C build/firebird.cfg -o bin/firebird.prg \
    build/loader_stage0.o \
    c64.lib

# the stage 1 loader contains the fast-loader code,
# but also a menu to opt for slow-loading
echo "-     link 'gma1.prg'"
$ld65 -C build/gma1.cfg \
    -o bin/gma1.prg \
    build/loader_stage1.o \
    build/loader_stage4_code.o \
    build/loader_stage4_data.o \
    c64.lib

echo "-     link 'byebyejulie.prg'"
$ld65 -C c64-asm.cfg -o bin/byebyejulie.prg \
    build/loader_stage2.o \
    c64.lib

echo "-     link 'gma3.prg'"
$ld65 -C c64-asm.cfg \
    --start-addr \$C800 -o bin/gma3.prg \
    build/loader_stage3.o \
    c64.lib

#-------------------------------------------------------------------------------

# "gma4.prg" will contain encrypted data/code blocks, so these areas of code
# have to be linked first, then encrypted and then re-linked. this link
# outputs the code and data-to-be-encrypted to seprate binaries:
#
# - "gma4_code.o" = the decryption routine
# - "gma4_data.o" = the binary to be encrypted and re-linked
#
echo "-     link 'gma4_*.bin'"
$ld65 -C build/gma4_decrypted.cfg -o build/gma4 \
    build/loader_stage4_code.o \
    build/loader_stage4_data.o

echo "-  encrypt 'gma4_data.bin'"
$encrypt build/gma4_data.bin build/gma4_data.s

# assemble the newly encrypted data
echo "- assemble 'gma4_data.s'"
$ca65 -o build/gma4_data.o \
    build/gma4_data.s

# now re-link with the encrypted binary blobs
echo "-     link 'gma4.prg'"
$ld65 -C build/gma4_encrypted.cfg -o bin/gma4.prg \
    build/loader_stage4_code.o \
    build/gma4_data.o \
    c64.lib

# link the encrypted payloads (to be disassembled and rebuilt)

echo "-     link 'gma5.prg'"
$ld65 -C c64-asm.cfg -o bin/gma5.prg \
    build/gma5.o --start-addr \$1D00 \
    c64.lib

echo "-     link 'gma6.prg'"
$ld65 -C c64-asm.cfg -o bin/gma6.prg \
    build/gma6.o --start-addr \$6A00 \
    c64.lib

#-------------------------------------------------------------------------------

echo
echo "* write floppy disk image"
$mkd64 -o bin/elite_gma86.d64 \
    -m xtracks -XDS \
    -m cbmdos -d "ELITE 040486" -i "GMA86" \
    -f bin/firebird.prg     -t 17 -s 0 -n "FIREBIRD"    -P -S 1 -w \
    -f bin/gma1.prg         -t 17 -s 1 -n "GMA1"        -P -S 2 -w \
    -f bin/byebyejulie.prg  -t 17 -s 4 -n "BYEBYEJULIE" -P -S 3 -w \
    -f bin/gma3.prg         -t 17 -s 5 -n "GMA3"        -P -S 4 -w \
    -f bin/gma4.prg         -t 17 -s 6 -n "GMA4"        -P -S 5 -w \
    -f bin/gma5.prg         -t 19 -s 0 -n "GMA5"        -P -S 6 -w \
    -f bin/gma6.prg         -t 20 -s 8 -n "GMA6"        -P -S 7 -w \
    1>/dev/null
echo "- OK"

#-------------------------------------------------------------------------------

echo
echo "* verifying checksums"
cd bin
md5sum -c checksums.txt
cd ..

echo
echo "complete."
exit 0