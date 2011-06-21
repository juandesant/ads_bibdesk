#!/bin/sh
# ADS to BibDesk -- frictionless import of ADS publications into BibDesk
# Copyright (C) 2011  Rui Pereira <rui.pereira@gmail.com>
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

# ugliest hack in the world - harcoded/compressed strings of both applescript and python scripts as in the automator actions
py="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"
scpt="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"
tmpdir=$(python -c "import tempfile; print tempfile.mkdtemp()")
python -c "import binascii,zlib;\
           out=open('${tmpdir}/py.py', 'w'); print >> out, zlib.decompress(binascii.a2b_base64('${py}')); \
           out=open('${tmpdir}/scpt.scpt', 'w'); print >> out, zlib.decompress(binascii.a2b_base64('${scpt}'))"

# go the tmp directory
cd $tmpdir

# fetch arXiv bibcodes from BibDesk using an applescript
bibcodes=$(cat << EOF | osascript -
tell document 1 of application "BibDesk"
	set bibcodes to {}
	repeat with thePub in publications
		if (count (every field of thePub whose name is "Adsurl" and (value contains "arxiv" or value contains "astro.ph"))) > 0 then
			-- get bibcode from ADSurl
			set ADSurl to (value of every field of thePub whose name is "Adsurl")
			set AppleScript's text item delimiters to "/"
			set end of bibcodes to last text item of text item 1 of ADSurl
		end if
	end repeat
end tell
set AppleScript's text item delimiters to " "
return bibcodes as text
EOF
)

if [ "$bibcodes" == "" ]; then echo "Nothing to update!"; exit; fi
# check for changed bibcodes
nbibcodes=$(echo $bibcodes | wc -w)
python -c "import math;n=$nbibcodes;t=math.ceil(n*15./60.); print 'Checking %i ArXiv entries for changes...\n(to prevent ADS flooding this will take a while, check back in around %i %s)' % (n, t, t > 1 and 'minutes' or 'minute')"
python py.py -u $bibcodes
# python py.py -u $bibcodes --debug # DEBUG MODE

changed=$(wc -l changed_arxiv | awk '{print $1}')
if [ "$changed" -gt "0" ]
then
    echo ""; echo "Updating $changed entries, continue? (y/[n])"
    read -n1 -s continue
else
    echo ""; echo "Nothing to update!"
    exit
fi
if [ "$continue" != "Y" ] && [ "$continue" != "y" ]
then exit
fi

echo "(to prevent ADS flooding, we will wait for a while between each update, so go grab a coffee)"
# update bibcodes
for bibcode in `cat changed_arxiv`; do
    echo "Updating $bibcode..."
    # sleep 1 minute if updating a lot of stuff, if not wait only 10s
    if [ "$changed" -gt "10" ]
    then
        sleep 60
    else
        sleep 15
    fi
    osascript scpt.scpt `python py.py ${bibcode}`
done

#clean up
cd - > /dev/null
rm -rf $tmpdir
