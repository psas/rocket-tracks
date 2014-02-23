<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="6.5.0">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="2" name="Route2" color="1" fill="3" visible="no" active="no"/>
<layer number="3" name="Route3" color="4" fill="3" visible="no" active="no"/>
<layer number="14" name="Route14" color="1" fill="6" visible="no" active="no"/>
<layer number="15" name="Route15" color="4" fill="6" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="15" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="50" name="dxf" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="15" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="56" name="wert" color="7" fill="1" visible="no" active="no"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
<layer number="100" name="Muster" color="7" fill="1" visible="no" active="no"/>
<layer number="101" name="Patch_Top" color="12" fill="4" visible="yes" active="yes"/>
<layer number="102" name="Mittellin" color="7" fill="1" visible="yes" active="yes"/>
<layer number="104" name="Name" color="7" fill="1" visible="yes" active="yes"/>
<layer number="105" name="Beschreib" color="9" fill="1" visible="no" active="no"/>
<layer number="106" name="BGA-Top" color="4" fill="1" visible="no" active="no"/>
<layer number="107" name="BD-Top" color="5" fill="1" visible="no" active="no"/>
<layer number="116" name="Patch_BOT" color="9" fill="4" visible="yes" active="yes"/>
<layer number="151" name="HeatSink" color="7" fill="1" visible="yes" active="yes"/>
<layer number="200" name="200bmp" color="1" fill="10" visible="no" active="no"/>
<layer number="250" name="Descript" color="3" fill="1" visible="no" active="no"/>
<layer number="251" name="SMDround" color="12" fill="11" visible="no" active="no"/>
<layer number="254" name="OrgLBR" color="7" fill="1" visible="yes" active="yes"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="motorFeedback">
<packages>
<package name="16100">
<wire x1="4.826" y1="1.016" x2="1.524" y2="1.016" width="0.127" layer="21"/>
<wire x1="1.524" y1="1.016" x2="1.524" y2="-1.016" width="0.127" layer="21"/>
<wire x1="1.524" y1="-1.016" x2="4.826" y2="-1.016" width="0.127" layer="21"/>
<circle x="0" y="0" radius="5.0038" width="0.127" layer="21"/>
<pad name="+" x="-2.54" y="0" drill="0.8"/>
<pad name="-" x="2.54" y="0" drill="0.8"/>
<text x="-4.572" y="-6.35" size="1.016" layer="21" font="vector">&gt;NAME</text>
<text x="-4.572" y="5.334" size="1.016" layer="21" font="vector">&gt;VALUE</text>
</package>
<package name="BATTERY_TERMINAL">
<pad name="1" x="0" y="0" drill="6.604" diameter="19.05" thermals="no"/>
<text x="-15.494" y="3.556" size="1.27" layer="25">&gt;Name</text>
<text x="-15.748" y="1.778" size="1.27" layer="27">&gt;Value</text>
</package>
</packages>
<symbols>
<symbol name="CPOL-US-1">
<wire x1="-2.54" y1="0" x2="2.54" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="-1.016" x2="0" y2="-2.54" width="0.1524" layer="94"/>
<wire x1="0" y1="-1" x2="2.4892" y2="-1.8542" width="0.254" layer="94" curve="-37.878202" cap="flat"/>
<wire x1="-2.4669" y1="-1.8504" x2="0" y2="-1.0161" width="0.254" layer="94" curve="-37.376341" cap="flat"/>
<text x="1.016" y="0.635" size="1.778" layer="95">&gt;NAME</text>
<text x="1.016" y="-4.191" size="1.778" layer="96">&gt;VALUE</text>
<rectangle x1="-2.253" y1="0.668" x2="-1.364" y2="0.795" layer="94"/>
<rectangle x1="-1.872" y1="0.287" x2="-1.745" y2="1.176" layer="94"/>
<pin name="+" x="0" y="2.54" visible="off" length="short" direction="pas" swaplevel="1" rot="R270"/>
<pin name="-" x="0" y="-5.08" visible="off" length="short" direction="pas" swaplevel="1" rot="R90"/>
</symbol>
<symbol name="BATTERY_TERMINAL">
<circle x="0" y="0" radius="5.6796125" width="0.254" layer="94"/>
<pin name="1" x="0" y="-10.16" length="middle" rot="R90"/>
<text x="-12.7" y="0" size="1.27" layer="94">&gt;Name</text>
<text x="-12.7" y="-2.54" size="1.27" layer="94">&gt;Value</text>
</symbol>
<symbol name="FRAME-1">
<wire x1="5.08" y1="5.08" x2="55.88" y2="5.08" width="0.254" layer="94"/>
<wire x1="55.88" y1="5.08" x2="106.68" y2="5.08" width="0.254" layer="94"/>
<wire x1="106.68" y1="5.08" x2="157.48" y2="5.08" width="0.254" layer="94"/>
<wire x1="157.48" y1="5.08" x2="208.28" y2="5.08" width="0.254" layer="94"/>
<wire x1="208.28" y1="5.08" x2="259.08" y2="5.08" width="0.254" layer="94"/>
<wire x1="259.08" y1="5.08" x2="294.64" y2="5.08" width="0.254" layer="94"/>
<wire x1="309.88" y1="5.08" x2="360.68" y2="5.08" width="0.254" layer="94"/>
<wire x1="360.68" y1="5.08" x2="411.48" y2="5.08" width="0.254" layer="94"/>
<wire x1="411.48" y1="34.925" x2="411.48" y2="55.88" width="0.254" layer="94"/>
<wire x1="411.48" y1="55.88" x2="411.48" y2="106.68" width="0.254" layer="94"/>
<wire x1="411.48" y1="106.68" x2="411.48" y2="157.48" width="0.254" layer="94"/>
<wire x1="411.48" y1="157.48" x2="411.48" y2="208.28" width="0.254" layer="94"/>
<wire x1="411.48" y1="208.28" x2="411.48" y2="250.825" width="0.254" layer="94"/>
<wire x1="411.48" y1="250.825" x2="411.48" y2="254" width="0.254" layer="94"/>
<wire x1="411.48" y1="254" x2="411.48" y2="259.08" width="0.254" layer="94"/>
<wire x1="55.88" y1="0" x2="55.88" y2="5.08" width="0.254" layer="94"/>
<wire x1="106.68" y1="0" x2="106.68" y2="5.08" width="0.254" layer="94"/>
<wire x1="157.48" y1="0" x2="157.48" y2="5.08" width="0.254" layer="94"/>
<wire x1="208.28" y1="0" x2="208.28" y2="5.08" width="0.254" layer="94"/>
<wire x1="259.08" y1="0" x2="259.08" y2="5.08" width="0.254" layer="94"/>
<wire x1="309.88" y1="0" x2="309.88" y2="5.08" width="0.254" layer="94"/>
<wire x1="360.68" y1="0" x2="360.68" y2="5.08" width="0.254" layer="94"/>
<wire x1="411.48" y1="55.88" x2="416.56" y2="55.88" width="0.254" layer="94"/>
<wire x1="411.48" y1="106.68" x2="416.56" y2="106.68" width="0.254" layer="94"/>
<wire x1="411.48" y1="157.48" x2="416.56" y2="157.48" width="0.254" layer="94"/>
<wire x1="411.48" y1="208.28" x2="416.56" y2="208.28" width="0.254" layer="94"/>
<wire x1="5.08" y1="5.08" x2="5.08" y2="55.88" width="0.254" layer="94"/>
<wire x1="5.08" y1="55.88" x2="5.08" y2="106.68" width="0.254" layer="94"/>
<wire x1="5.08" y1="106.68" x2="5.08" y2="157.48" width="0.254" layer="94"/>
<wire x1="5.08" y1="157.48" x2="5.08" y2="208.28" width="0.254" layer="94"/>
<wire x1="5.08" y1="208.28" x2="5.08" y2="259.08" width="0.254" layer="94"/>
<wire x1="5.08" y1="55.88" x2="0" y2="55.88" width="0.254" layer="94"/>
<wire x1="5.08" y1="106.68" x2="0" y2="106.68" width="0.254" layer="94"/>
<wire x1="5.08" y1="157.48" x2="0" y2="157.48" width="0.254" layer="94"/>
<wire x1="5.08" y1="208.28" x2="0" y2="208.28" width="0.254" layer="94"/>
<wire x1="5.08" y1="259.08" x2="55.88" y2="259.08" width="0.254" layer="94"/>
<wire x1="55.88" y1="259.08" x2="106.68" y2="259.08" width="0.254" layer="94"/>
<wire x1="106.68" y1="259.08" x2="157.48" y2="259.08" width="0.254" layer="94"/>
<wire x1="157.48" y1="259.08" x2="208.28" y2="259.08" width="0.254" layer="94"/>
<wire x1="208.28" y1="259.08" x2="259.08" y2="259.08" width="0.254" layer="94"/>
<wire x1="259.08" y1="259.08" x2="264.16" y2="259.08" width="0.254" layer="94"/>
<wire x1="264.16" y1="259.08" x2="271.78" y2="259.08" width="0.254" layer="94"/>
<wire x1="271.78" y1="259.08" x2="309.88" y2="259.08" width="0.254" layer="94"/>
<wire x1="309.88" y1="259.08" x2="355.6" y2="259.08" width="0.254" layer="94"/>
<wire x1="360.68" y1="259.08" x2="355.6" y2="259.08" width="0.254" layer="94"/>
<wire x1="360.68" y1="259.08" x2="376.555" y2="259.08" width="0.254" layer="94"/>
<wire x1="376.555" y1="259.08" x2="411.48" y2="259.08" width="0.254" layer="94"/>
<wire x1="55.88" y1="264.16" x2="55.88" y2="259.08" width="0.254" layer="94"/>
<wire x1="106.68" y1="264.16" x2="106.68" y2="259.08" width="0.254" layer="94"/>
<wire x1="157.48" y1="264.16" x2="157.48" y2="259.08" width="0.254" layer="94"/>
<wire x1="208.28" y1="264.16" x2="208.28" y2="259.08" width="0.254" layer="94"/>
<wire x1="259.08" y1="264.16" x2="259.08" y2="259.08" width="0.254" layer="94"/>
<wire x1="309.88" y1="264.16" x2="309.88" y2="259.08" width="0.254" layer="94"/>
<wire x1="360.68" y1="264.16" x2="360.68" y2="259.08" width="0.254" layer="94"/>
<wire x1="376.555" y1="259.08" x2="376.555" y2="254" width="0.254" layer="94"/>
<wire x1="376.555" y1="254" x2="411.48" y2="254" width="0.254" layer="94"/>
<wire x1="376.555" y1="254" x2="355.6" y2="254" width="0.254" layer="94"/>
<wire x1="355.6" y1="254" x2="271.78" y2="254" width="0.254" layer="94"/>
<wire x1="271.78" y1="254" x2="264.16" y2="254" width="0.254" layer="94"/>
<wire x1="264.16" y1="254" x2="264.16" y2="250.825" width="0.254" layer="94"/>
<wire x1="264.16" y1="250.825" x2="271.78" y2="250.825" width="0.254" layer="94"/>
<wire x1="271.78" y1="250.825" x2="355.6" y2="250.825" width="0.254" layer="94"/>
<wire x1="355.6" y1="250.825" x2="376.555" y2="250.825" width="0.254" layer="94"/>
<wire x1="376.555" y1="250.825" x2="411.48" y2="250.825" width="0.254" layer="94"/>
<wire x1="271.78" y1="254" x2="271.78" y2="250.825" width="0.254" layer="94"/>
<wire x1="355.6" y1="254" x2="355.6" y2="250.825" width="0.254" layer="94"/>
<wire x1="376.555" y1="254" x2="376.555" y2="250.825" width="0.254" layer="94"/>
<wire x1="264.16" y1="254" x2="264.16" y2="259.08" width="0.254" layer="94"/>
<wire x1="271.78" y1="254" x2="271.78" y2="259.08" width="0.254" layer="94"/>
<wire x1="355.6" y1="254" x2="355.6" y2="259.08" width="0.254" layer="94"/>
<wire x1="294.64" y1="17.78" x2="344.17" y2="17.78" width="0.254" layer="94"/>
<wire x1="352.425" y1="17.78" x2="352.425" y2="34.925" width="0.254" layer="94"/>
<wire x1="352.425" y1="34.925" x2="411.48" y2="34.925" width="0.254" layer="94"/>
<wire x1="411.48" y1="34.925" x2="411.48" y2="17.78" width="0.254" layer="94"/>
<wire x1="411.48" y1="17.78" x2="352.425" y2="17.78" width="0.254" layer="94"/>
<wire x1="344.17" y1="17.78" x2="352.425" y2="17.78" width="0.254" layer="94"/>
<wire x1="294.64" y1="17.78" x2="294.64" y2="14.605" width="0.254" layer="94"/>
<wire x1="294.64" y1="14.605" x2="344.17" y2="14.605" width="0.254" layer="94"/>
<wire x1="344.17" y1="14.605" x2="344.17" y2="17.78" width="0.254" layer="94"/>
<wire x1="294.64" y1="14.605" x2="294.64" y2="11.43" width="0.254" layer="94"/>
<wire x1="294.64" y1="11.43" x2="344.17" y2="11.43" width="0.254" layer="94"/>
<wire x1="344.17" y1="11.43" x2="344.17" y2="14.605" width="0.254" layer="94"/>
<wire x1="294.64" y1="11.43" x2="294.64" y2="8.255" width="0.254" layer="94"/>
<wire x1="294.64" y1="8.255" x2="344.17" y2="8.255" width="0.254" layer="94"/>
<wire x1="344.17" y1="8.255" x2="344.17" y2="11.43" width="0.254" layer="94"/>
<wire x1="411.48" y1="11.43" x2="411.48" y2="17.78" width="0.254" layer="94"/>
<wire x1="344.17" y1="11.43" x2="411.48" y2="11.43" width="0.254" layer="94"/>
<wire x1="344.17" y1="8.255" x2="411.48" y2="8.255" width="0.254" layer="94"/>
<wire x1="411.48" y1="8.255" x2="411.48" y2="11.43" width="0.254" layer="94"/>
<wire x1="294.64" y1="8.255" x2="294.64" y2="5.08" width="0.254" layer="94"/>
<wire x1="294.64" y1="5.08" x2="309.88" y2="5.08" width="0.254" layer="94"/>
<wire x1="411.48" y1="5.08" x2="411.48" y2="8.255" width="0.254" layer="94"/>
<text x="131.064" y="1.016" size="2.54" layer="94" font="vector">C</text>
<text x="80.518" y="1.016" size="2.54" layer="94" font="vector">B</text>
<text x="29.464" y="1.016" size="2.54" layer="94" font="vector">A</text>
<text x="181.864" y="1.016" size="2.54" layer="94" font="vector">D</text>
<text x="232.664" y="1.016" size="2.54" layer="94" font="vector">E</text>
<text x="283.464" y="1.016" size="2.54" layer="94" font="vector">F</text>
<text x="334.264" y="1.016" size="2.54" layer="94" font="vector">G</text>
<text x="385.064" y="1.016" size="2.54" layer="94" font="vector">H</text>
<text x="413.004" y="232.156" size="2.54" layer="94" font="vector">1</text>
<text x="413.004" y="181.356" size="2.54" layer="94" font="vector">2</text>
<text x="413.004" y="130.556" size="2.54" layer="94" font="vector">3</text>
<text x="413.004" y="79.756" size="2.54" layer="94" font="vector">4</text>
<text x="413.004" y="28.956" size="2.54" layer="94" font="vector">5</text>
<text x="1.524" y="232.156" size="2.54" layer="94" font="vector">1</text>
<text x="1.524" y="181.356" size="2.54" layer="94" font="vector">2</text>
<text x="1.524" y="130.556" size="2.54" layer="94" font="vector">3</text>
<text x="1.524" y="79.756" size="2.54" layer="94" font="vector">4</text>
<text x="1.524" y="28.956" size="2.54" layer="94" font="vector">5</text>
<text x="131.064" y="260.096" size="2.54" layer="94" font="vector">C</text>
<text x="80.518" y="260.096" size="2.54" layer="94" font="vector">B</text>
<text x="29.464" y="260.096" size="2.54" layer="94" font="vector">A</text>
<text x="181.864" y="260.096" size="2.54" layer="94" font="vector">D</text>
<text x="232.664" y="260.096" size="2.54" layer="94" font="vector">E</text>
<text x="283.464" y="260.096" size="2.54" layer="94" font="vector">F</text>
<text x="334.264" y="260.096" size="2.54" layer="94" font="vector">G</text>
<text x="385.064" y="260.096" size="2.54" layer="94" font="vector">H</text>
<text x="265.43" y="255.27" size="2.1844" layer="94" font="vector">REV</text>
<text x="273.05" y="255.27" size="2.1844" layer="94" font="vector">DESCRIPTION</text>
<text x="356.87" y="255.27" size="2.1844" layer="94" font="vector">DATE</text>
<text x="377.825" y="255.27" size="2.1844" layer="94" font="vector">ENGINEER</text>
<text x="315.595" y="13.97" size="1.905" layer="94" font="vector" rot="R180">DRAWN BY :</text>
<text x="315.595" y="10.795" size="1.905" layer="94" font="vector" rot="R180">CHECKED BY :</text>
<text x="315.595" y="17.145" size="1.905" layer="94" font="vector" rot="R180">ENGINEER :</text>
<text x="345.44" y="12.7" size="3.81" layer="94" font="vector">&gt;DRAWING_NAME</text>
<text x="367.03" y="10.795" size="1.905" layer="94" font="vector" rot="R180">PART NUMBER :</text>
<text x="358.14" y="24.13" size="3.81" layer="94" font="vector">RocketTracks</text>
<text x="297.18" y="5.715" size="1.905" layer="94" font="vector">&gt;LAST_DATE_TIME</text>
<text x="365.76" y="5.715" size="1.905" layer="94" font="vector">SHEET :</text>
<text x="377.825" y="5.715" size="1.905" layer="94" font="vector">&gt;SHEET</text>
<text x="265.43" y="251.46" size="1.905" layer="94" font="vector">001</text>
<text x="316.484" y="15.24" size="1.905" layer="94" font="vector">ROB GASKELL</text>
<text x="316.484" y="12.192" size="1.905" layer="94" font="vector">ROB GASKELL</text>
</symbol>
</symbols>
<devicesets>
<deviceset name="16100" prefix="C">
<gates>
<gate name="G$1" symbol="CPOL-US-1" x="0" y="0"/>
</gates>
<devices>
<device name="E" package="16100">
<connects>
<connect gate="G$1" pin="+" pad="+"/>
<connect gate="G$1" pin="-" pad="-"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="BATTERY_TERMINAL" prefix="BT">
<gates>
<gate name="BT$1" symbol="BATTERY_TERMINAL" x="0" y="0"/>
</gates>
<devices>
<device name="" package="BATTERY_TERMINAL">
<connects>
<connect gate="BT$1" pin="1" pad="1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="FRAME">
<gates>
<gate name="G$1" symbol="FRAME-1" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0" drill="0">
</class>
</classes>
<parts>
<part name="C1" library="motorFeedback" deviceset="16100" device="E"/>
<part name="C2" library="motorFeedback" deviceset="16100" device="E"/>
<part name="C3" library="motorFeedback" deviceset="16100" device="E"/>
<part name="C4" library="motorFeedback" deviceset="16100" device="E"/>
<part name="C5" library="motorFeedback" deviceset="16100" device="E"/>
<part name="C6" library="motorFeedback" deviceset="16100" device="E"/>
<part name="C7" library="motorFeedback" deviceset="16100" device="E"/>
<part name="C8" library="motorFeedback" deviceset="16100" device="E"/>
<part name="C9" library="motorFeedback" deviceset="16100" device="E"/>
<part name="C10" library="motorFeedback" deviceset="16100" device="E"/>
<part name="C11" library="motorFeedback" deviceset="16100" device="E"/>
<part name="C12" library="motorFeedback" deviceset="16100" device="E"/>
<part name="C13" library="motorFeedback" deviceset="16100" device="E"/>
<part name="C14" library="motorFeedback" deviceset="16100" device="E"/>
<part name="C15" library="motorFeedback" deviceset="16100" device="E"/>
<part name="C16" library="motorFeedback" deviceset="16100" device="E"/>
<part name="C17" library="motorFeedback" deviceset="16100" device="E"/>
<part name="C18" library="motorFeedback" deviceset="16100" device="E"/>
<part name="C19" library="motorFeedback" deviceset="16100" device="E"/>
<part name="C20" library="motorFeedback" deviceset="16100" device="E"/>
<part name="BT1" library="motorFeedback" deviceset="BATTERY_TERMINAL" device=""/>
<part name="BT2" library="motorFeedback" deviceset="BATTERY_TERMINAL" device=""/>
<part name="U$1" library="motorFeedback" deviceset="FRAME" device=""/>
</parts>
<sheets>
<sheet>
<plain>
</plain>
<instances>
<instance part="C1" gate="G$1" x="91.44" y="132.08"/>
<instance part="C2" gate="G$1" x="104.14" y="132.08"/>
<instance part="C3" gate="G$1" x="116.84" y="132.08"/>
<instance part="C4" gate="G$1" x="129.54" y="132.08"/>
<instance part="C5" gate="G$1" x="142.24" y="132.08"/>
<instance part="C6" gate="G$1" x="154.94" y="132.08"/>
<instance part="C7" gate="G$1" x="167.64" y="132.08"/>
<instance part="C8" gate="G$1" x="180.34" y="132.08"/>
<instance part="C9" gate="G$1" x="193.04" y="132.08"/>
<instance part="C10" gate="G$1" x="205.74" y="132.08"/>
<instance part="C11" gate="G$1" x="218.44" y="132.08"/>
<instance part="C12" gate="G$1" x="231.14" y="132.08"/>
<instance part="C13" gate="G$1" x="243.84" y="132.08"/>
<instance part="C14" gate="G$1" x="256.54" y="132.08"/>
<instance part="C15" gate="G$1" x="269.24" y="132.08"/>
<instance part="C16" gate="G$1" x="281.94" y="132.08"/>
<instance part="C17" gate="G$1" x="294.64" y="132.08"/>
<instance part="C18" gate="G$1" x="307.34" y="132.08"/>
<instance part="C19" gate="G$1" x="320.04" y="132.08"/>
<instance part="C20" gate="G$1" x="332.74" y="132.08"/>
<instance part="BT1" gate="BT$1" x="86.36" y="152.4"/>
<instance part="BT2" gate="BT$1" x="337.82" y="109.22" rot="R180"/>
<instance part="U$1" gate="G$1" x="0" y="0"/>
</instances>
<busses>
</busses>
<nets>
<net name="VCC" class="0">
<segment>
<pinref part="C20" gate="G$1" pin="+"/>
<wire x1="332.74" y1="134.62" x2="332.74" y2="137.16" width="0.1524" layer="91"/>
<pinref part="C19" gate="G$1" pin="+"/>
<wire x1="332.74" y1="137.16" x2="320.04" y2="137.16" width="0.1524" layer="91"/>
<wire x1="320.04" y1="134.62" x2="320.04" y2="137.16" width="0.1524" layer="91"/>
<pinref part="C18" gate="G$1" pin="+"/>
<wire x1="320.04" y1="137.16" x2="307.34" y2="137.16" width="0.1524" layer="91"/>
<wire x1="307.34" y1="134.62" x2="307.34" y2="137.16" width="0.1524" layer="91"/>
<pinref part="C17" gate="G$1" pin="+"/>
<wire x1="307.34" y1="137.16" x2="294.64" y2="137.16" width="0.1524" layer="91"/>
<wire x1="294.64" y1="134.62" x2="294.64" y2="137.16" width="0.1524" layer="91"/>
<pinref part="C16" gate="G$1" pin="+"/>
<wire x1="294.64" y1="137.16" x2="281.94" y2="137.16" width="0.1524" layer="91"/>
<wire x1="281.94" y1="134.62" x2="281.94" y2="137.16" width="0.1524" layer="91"/>
<pinref part="C15" gate="G$1" pin="+"/>
<wire x1="281.94" y1="137.16" x2="269.24" y2="137.16" width="0.1524" layer="91"/>
<wire x1="269.24" y1="134.62" x2="269.24" y2="137.16" width="0.1524" layer="91"/>
<pinref part="C14" gate="G$1" pin="+"/>
<wire x1="269.24" y1="137.16" x2="256.54" y2="137.16" width="0.1524" layer="91"/>
<wire x1="256.54" y1="134.62" x2="256.54" y2="137.16" width="0.1524" layer="91"/>
<pinref part="C13" gate="G$1" pin="+"/>
<wire x1="256.54" y1="137.16" x2="243.84" y2="137.16" width="0.1524" layer="91"/>
<wire x1="243.84" y1="134.62" x2="243.84" y2="137.16" width="0.1524" layer="91"/>
<pinref part="C12" gate="G$1" pin="+"/>
<wire x1="243.84" y1="137.16" x2="231.14" y2="137.16" width="0.1524" layer="91"/>
<wire x1="231.14" y1="134.62" x2="231.14" y2="137.16" width="0.1524" layer="91"/>
<pinref part="C11" gate="G$1" pin="+"/>
<wire x1="231.14" y1="137.16" x2="218.44" y2="137.16" width="0.1524" layer="91"/>
<wire x1="218.44" y1="134.62" x2="218.44" y2="137.16" width="0.1524" layer="91"/>
<pinref part="C10" gate="G$1" pin="+"/>
<wire x1="218.44" y1="137.16" x2="205.74" y2="137.16" width="0.1524" layer="91"/>
<wire x1="205.74" y1="134.62" x2="205.74" y2="137.16" width="0.1524" layer="91"/>
<pinref part="C9" gate="G$1" pin="+"/>
<wire x1="205.74" y1="137.16" x2="193.04" y2="137.16" width="0.1524" layer="91"/>
<wire x1="193.04" y1="134.62" x2="193.04" y2="137.16" width="0.1524" layer="91"/>
<pinref part="C8" gate="G$1" pin="+"/>
<wire x1="193.04" y1="137.16" x2="180.34" y2="137.16" width="0.1524" layer="91"/>
<wire x1="180.34" y1="134.62" x2="180.34" y2="137.16" width="0.1524" layer="91"/>
<pinref part="C7" gate="G$1" pin="+"/>
<wire x1="180.34" y1="137.16" x2="167.64" y2="137.16" width="0.1524" layer="91"/>
<wire x1="167.64" y1="134.62" x2="167.64" y2="137.16" width="0.1524" layer="91"/>
<pinref part="C6" gate="G$1" pin="+"/>
<wire x1="167.64" y1="137.16" x2="154.94" y2="137.16" width="0.1524" layer="91"/>
<wire x1="154.94" y1="134.62" x2="154.94" y2="137.16" width="0.1524" layer="91"/>
<pinref part="C5" gate="G$1" pin="+"/>
<wire x1="154.94" y1="137.16" x2="142.24" y2="137.16" width="0.1524" layer="91"/>
<wire x1="142.24" y1="134.62" x2="142.24" y2="137.16" width="0.1524" layer="91"/>
<pinref part="C4" gate="G$1" pin="+"/>
<wire x1="142.24" y1="137.16" x2="129.54" y2="137.16" width="0.1524" layer="91"/>
<wire x1="129.54" y1="134.62" x2="129.54" y2="137.16" width="0.1524" layer="91"/>
<pinref part="C3" gate="G$1" pin="+"/>
<wire x1="129.54" y1="137.16" x2="116.84" y2="137.16" width="0.1524" layer="91"/>
<wire x1="116.84" y1="134.62" x2="116.84" y2="137.16" width="0.1524" layer="91"/>
<pinref part="C2" gate="G$1" pin="+"/>
<wire x1="116.84" y1="137.16" x2="104.14" y2="137.16" width="0.1524" layer="91"/>
<wire x1="104.14" y1="134.62" x2="104.14" y2="137.16" width="0.1524" layer="91"/>
<pinref part="C1" gate="G$1" pin="+"/>
<wire x1="104.14" y1="137.16" x2="91.44" y2="137.16" width="0.1524" layer="91"/>
<wire x1="91.44" y1="134.62" x2="91.44" y2="137.16" width="0.1524" layer="91"/>
<wire x1="91.44" y1="137.16" x2="86.36" y2="137.16" width="0.1524" layer="91"/>
<wire x1="86.36" y1="137.16" x2="86.36" y2="142.24" width="0.1524" layer="91"/>
<pinref part="BT1" gate="BT$1" pin="1"/>
<label x="86.36" y="142.24" size="1.778" layer="95" rot="R180"/>
<junction x="320.04" y="137.16"/>
<junction x="307.34" y="137.16"/>
<junction x="294.64" y="137.16"/>
<junction x="281.94" y="137.16"/>
<junction x="269.24" y="137.16"/>
<junction x="256.54" y="137.16"/>
<junction x="243.84" y="137.16"/>
<junction x="231.14" y="137.16"/>
<junction x="218.44" y="137.16"/>
<junction x="205.74" y="137.16"/>
<junction x="193.04" y="137.16"/>
<junction x="180.34" y="137.16"/>
<junction x="167.64" y="137.16"/>
<junction x="154.94" y="137.16"/>
<junction x="142.24" y="137.16"/>
<junction x="129.54" y="137.16"/>
<junction x="116.84" y="137.16"/>
<junction x="104.14" y="137.16"/>
<junction x="91.44" y="137.16"/>
</segment>
</net>
<net name="GND" class="0">
<segment>
<pinref part="C1" gate="G$1" pin="-"/>
<wire x1="91.44" y1="127" x2="91.44" y2="124.46" width="0.1524" layer="91"/>
<pinref part="C2" gate="G$1" pin="-"/>
<wire x1="91.44" y1="124.46" x2="104.14" y2="124.46" width="0.1524" layer="91"/>
<wire x1="104.14" y1="127" x2="104.14" y2="124.46" width="0.1524" layer="91"/>
<pinref part="C3" gate="G$1" pin="-"/>
<wire x1="104.14" y1="124.46" x2="116.84" y2="124.46" width="0.1524" layer="91"/>
<wire x1="116.84" y1="127" x2="116.84" y2="124.46" width="0.1524" layer="91"/>
<pinref part="C4" gate="G$1" pin="-"/>
<wire x1="116.84" y1="124.46" x2="129.54" y2="124.46" width="0.1524" layer="91"/>
<wire x1="129.54" y1="127" x2="129.54" y2="124.46" width="0.1524" layer="91"/>
<pinref part="C5" gate="G$1" pin="-"/>
<wire x1="129.54" y1="124.46" x2="142.24" y2="124.46" width="0.1524" layer="91"/>
<wire x1="142.24" y1="127" x2="142.24" y2="124.46" width="0.1524" layer="91"/>
<pinref part="C6" gate="G$1" pin="-"/>
<wire x1="142.24" y1="124.46" x2="154.94" y2="124.46" width="0.1524" layer="91"/>
<wire x1="154.94" y1="127" x2="154.94" y2="124.46" width="0.1524" layer="91"/>
<pinref part="C7" gate="G$1" pin="-"/>
<wire x1="154.94" y1="124.46" x2="167.64" y2="124.46" width="0.1524" layer="91"/>
<wire x1="167.64" y1="127" x2="167.64" y2="124.46" width="0.1524" layer="91"/>
<pinref part="C8" gate="G$1" pin="-"/>
<wire x1="167.64" y1="124.46" x2="180.34" y2="124.46" width="0.1524" layer="91"/>
<wire x1="180.34" y1="127" x2="180.34" y2="124.46" width="0.1524" layer="91"/>
<pinref part="C9" gate="G$1" pin="-"/>
<wire x1="180.34" y1="124.46" x2="193.04" y2="124.46" width="0.1524" layer="91"/>
<wire x1="193.04" y1="127" x2="193.04" y2="124.46" width="0.1524" layer="91"/>
<pinref part="C10" gate="G$1" pin="-"/>
<wire x1="193.04" y1="124.46" x2="205.74" y2="124.46" width="0.1524" layer="91"/>
<wire x1="205.74" y1="127" x2="205.74" y2="124.46" width="0.1524" layer="91"/>
<pinref part="C11" gate="G$1" pin="-"/>
<wire x1="205.74" y1="124.46" x2="218.44" y2="124.46" width="0.1524" layer="91"/>
<wire x1="218.44" y1="127" x2="218.44" y2="124.46" width="0.1524" layer="91"/>
<pinref part="C12" gate="G$1" pin="-"/>
<wire x1="218.44" y1="124.46" x2="231.14" y2="124.46" width="0.1524" layer="91"/>
<wire x1="231.14" y1="127" x2="231.14" y2="124.46" width="0.1524" layer="91"/>
<pinref part="C13" gate="G$1" pin="-"/>
<wire x1="231.14" y1="124.46" x2="243.84" y2="124.46" width="0.1524" layer="91"/>
<wire x1="243.84" y1="127" x2="243.84" y2="124.46" width="0.1524" layer="91"/>
<pinref part="C14" gate="G$1" pin="-"/>
<wire x1="243.84" y1="124.46" x2="256.54" y2="124.46" width="0.1524" layer="91"/>
<wire x1="256.54" y1="127" x2="256.54" y2="124.46" width="0.1524" layer="91"/>
<pinref part="C15" gate="G$1" pin="-"/>
<wire x1="256.54" y1="124.46" x2="269.24" y2="124.46" width="0.1524" layer="91"/>
<wire x1="269.24" y1="127" x2="269.24" y2="124.46" width="0.1524" layer="91"/>
<pinref part="C16" gate="G$1" pin="-"/>
<wire x1="269.24" y1="124.46" x2="281.94" y2="124.46" width="0.1524" layer="91"/>
<wire x1="281.94" y1="127" x2="281.94" y2="124.46" width="0.1524" layer="91"/>
<pinref part="C17" gate="G$1" pin="-"/>
<wire x1="281.94" y1="124.46" x2="294.64" y2="124.46" width="0.1524" layer="91"/>
<wire x1="294.64" y1="127" x2="294.64" y2="124.46" width="0.1524" layer="91"/>
<pinref part="C18" gate="G$1" pin="-"/>
<wire x1="294.64" y1="124.46" x2="307.34" y2="124.46" width="0.1524" layer="91"/>
<wire x1="307.34" y1="127" x2="307.34" y2="124.46" width="0.1524" layer="91"/>
<pinref part="C19" gate="G$1" pin="-"/>
<wire x1="307.34" y1="124.46" x2="320.04" y2="124.46" width="0.1524" layer="91"/>
<wire x1="320.04" y1="127" x2="320.04" y2="124.46" width="0.1524" layer="91"/>
<pinref part="C20" gate="G$1" pin="-"/>
<wire x1="320.04" y1="124.46" x2="332.74" y2="124.46" width="0.1524" layer="91"/>
<wire x1="332.74" y1="127" x2="332.74" y2="124.46" width="0.1524" layer="91"/>
<wire x1="332.74" y1="124.46" x2="337.82" y2="124.46" width="0.1524" layer="91"/>
<wire x1="337.82" y1="124.46" x2="337.82" y2="119.38" width="0.1524" layer="91"/>
<pinref part="BT2" gate="BT$1" pin="1"/>
<label x="337.82" y="119.38" size="1.778" layer="95"/>
<junction x="154.94" y="124.46"/>
<junction x="167.64" y="124.46"/>
<junction x="180.34" y="124.46"/>
<junction x="193.04" y="124.46"/>
<junction x="205.74" y="124.46"/>
<junction x="218.44" y="124.46"/>
<junction x="231.14" y="124.46"/>
<junction x="243.84" y="124.46"/>
<junction x="256.54" y="124.46"/>
<junction x="269.24" y="124.46"/>
<junction x="281.94" y="124.46"/>
<junction x="294.64" y="124.46"/>
<junction x="307.34" y="124.46"/>
<junction x="320.04" y="124.46"/>
<junction x="332.74" y="124.46"/>
<junction x="104.14" y="124.46"/>
<junction x="116.84" y="124.46"/>
<junction x="129.54" y="124.46"/>
<junction x="142.24" y="124.46"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
</eagle>
