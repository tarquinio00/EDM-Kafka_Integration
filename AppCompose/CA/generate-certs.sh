#!/bin/bash

SUBJECT_CA="/C=IT/ST=Puglia/L=Foggia/O=LAN System Labs s.r.l/OU=Certificate Authority"

function generate_ca() {
        #===========================================================================
        #       Generating Certificate Authority Key Pair
        #===========================================================================

        echo "STEP1: Generating Certificate Authority"
        echo $SUBJECT_CA

        openssl req -new -x509 -days 10950 -subj "$SUBJECT_CA" -keyout ca.key -out ca.crt
}



generate_ca

exit 0
