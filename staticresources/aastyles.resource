#tabs ul {
list-style-image:none;
list-style-position:outside;
list-style-type:none;
padding:5px 10px 0px 30px;
}
#tabs li {
display:inline;
margin:0px;
padding:0px;
}
#tabs a.curtab {
border-bottom: #E9702D 4px solid;
color: black;
}
#tabs a {
cursor:pointer;
margin:0px 12px 0px 12px;
padding-bottom: 8px;
text-decoration:none;
font-family:Arial,Verdana,sans-serif;
font-size:12px;
font-weight: bold;
color: #998C7C;
}
li.aaBullet {
padding: 0 0 0 10px;
background: url(aabullet) no-repeat top left; /* relative path to other static resource - nice! */
list-style: none;
margin-bottom: 1em;
}
div.aaTableHdr {
padding:4px;
font-weight:bold;
margin-left:-16px;
margin-top:16px;
}
/*-----  aaPendingAddrs -----*/
table.aaPending tr th, table.aaPending tr td {
vertical-align: top;
}
span.lookupInput {
vertical-align: top;
}
table.aaPending tr.if { /*default state of action field rows; cannot set 'display' because, when showing, we must set to '' which will reset it to its stylesheet value (because IE is buggy and doesn't support 'table-row')*/
visibility: hidden; 
}
table.aaPending img.lookupIcon {
margin-bottom: -5px;
}
table.aaPending tr th span {
padding-left:12px;
font-size:8pt;
font-weight:normal;
}
table.aaPending tr td.required {
background: url(requiredBlock) no-repeat center left;
}

div.pendingErrors {
border: red 1px solid;
margin: 20px;
margin-top: 0px;
padding: 10px;
background: url(alert_32) no-repeat center left;
}
div.pendingErrors div {
margin-left: 40px;
line-height: 1.2;
}

div.pendingResults {
border: #998C7C 1px solid;
margin: 20px;
margin-top: 0px;
padding: 10px;
background: url(info_32) no-repeat center left;
}
div.pendingResults div {
margin-left: 40px;
line-height: 1.2;
}

/*----- other common elements -----*/
span.comment {
margin-left: 12px;
}
div.helptext {
font-weight:normal;
font-size:91%;
}
span.helptext {
font-weight: normal;
font-size: 91%;
font-style: italic;
}
span.case {
font-size: 75%;
margin-left: 8px;
}
span.case a {
padding-left: 2px;
padding-right: 2px;
}

div.recentStats {
border:1px solid #998C7C;
margin:20px;
padding:10px;
margin-top: 0px;
}
/* single-nested spans hold the main text */
div.recentStats span.recentStats { 
background: url(aabullet) no-repeat center left;
padding-left:10px;
}

/* double-nested spans hold the counts */
div.recentStats span.recentStat { 
font-size:110%;
font-weight: bold;
}

div.prevNext {
text-align:center;
font-size:91%;
margin-top:-2px;
margin-bottom:2px;
}

div.fewerMore { /* addition to sfdc-provided style */
margin-top:2px;
}

div.snippetFrom, div.snippetTo {
float:left;
}

div.snippetFrom {
width:37px;
}

div.snippetTo { /* inbound mail marker */
padding-left:15px;
width:22px;
background: url(aabullet) no-repeat top left;
}
 
td.colTo {  /* inbound mail marker */
background: url(aabullet) no-repeat scroll 1px 5px;
}

td.rowTo { /* hilite inbound mail */
background-color: #FCFCFA;
}
