; BASIC auto-run header: Når programmet indlæses i C64, starter det automatisk med SYS 2304
*=$0801                       ; Startadresse for BASIC auto-run header
        BYTE    $0E, $08, $0A, $00, $9E, $20, $28,  $32, $33, $30, $34, $29, $00, $00, $00
        ; $080E = startadresse for programmet
        ; SYS 2304 er BASIC-koden, der starter programmet

PRINT_LINE = $AB1E            ; Adresse for kernal-rutinen, der udskriver en null-termineret streng
*=$0900                       ; Startadresse for selve maskinkoden

START
        lda #<HELLOWORLD      ; Indlæs lav byte af adressen til HELLOWORLD i A-registeret
        ldy #>HELLOWORLD      ; Indlæs høj byte af adressen til HELLOWORLD i Y-registeret
        jsr PRINT_LINE        ; Kald kernal-rutinen på $AB1E for at udskrive strengen
        jmp START             ; Gå tilbage til START og gentag (uendelig løkke)

HELLOWORLD
        text "hello world!"   ; Definer tekststrengen "hello world!"
        byte 13, 00           ; Tilføj et linjeskift (ASCII 13) og null-terminator (ASCII 0) for at afslutte strengen
