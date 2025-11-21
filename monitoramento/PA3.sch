<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="7.7.0">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="24" fill="1" visible="no" active="no"/>
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
<layer number="51" name="tDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="88" name="SimResults" color="9" fill="1" visible="yes" active="yes"/>
<layer number="89" name="SimProbes" color="9" fill="1" visible="yes" active="yes"/>
<layer number="90" name="Modules" color="5" fill="1" visible="yes" active="yes"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="ESP32-DEVKITC(38PINS)">
<packages>
<package name="ESP32-DEVKITC">
<pad name="1" x="0.01" y="0" drill="1" diameter="1.9304"/>
<pad name="2" x="2.55" y="0" drill="1" diameter="1.9304"/>
<pad name="3" x="5.09" y="0" drill="1" diameter="1.9304"/>
<pad name="4" x="7.63" y="0" drill="1" diameter="1.9304"/>
<pad name="5" x="10.17" y="0" drill="1" diameter="1.9304"/>
<pad name="6" x="12.71" y="0" drill="1" diameter="1.9304"/>
<pad name="7" x="15.25" y="0" drill="1" diameter="1.9304"/>
<pad name="8" x="17.79" y="0" drill="1" diameter="1.9304"/>
<pad name="9" x="20.33" y="0" drill="1" diameter="1.9304"/>
<pad name="10" x="22.87" y="0" drill="1" diameter="1.9304"/>
<pad name="11" x="25.41" y="0" drill="1" diameter="1.9304"/>
<pad name="12" x="27.95" y="0" drill="1" diameter="1.9304"/>
<pad name="13" x="30.49" y="0" drill="1" diameter="1.9304"/>
<pad name="14" x="33.03" y="0" drill="1" diameter="1.9304"/>
<pad name="15" x="35.57" y="0" drill="1" diameter="1.9304"/>
<pad name="16" x="38.11" y="0" drill="1" diameter="1.9304"/>
<pad name="17" x="40.65" y="0" drill="1" diameter="1.9304"/>
<pad name="18" x="43.19" y="0" drill="1" diameter="1.9304"/>
<pad name="19" x="45.73" y="0" drill="1" diameter="1.9304"/>
<pad name="38" x="0" y="24" drill="1" diameter="1.9304"/>
<pad name="37" x="2.55" y="24" drill="1" diameter="1.9304"/>
<pad name="36" x="5.09" y="24" drill="1" diameter="1.9304"/>
<pad name="35" x="7.63" y="24" drill="1" diameter="1.9304"/>
<pad name="34" x="10.17" y="24" drill="1" diameter="1.9304"/>
<pad name="33" x="12.71" y="24" drill="1" diameter="1.9304"/>
<pad name="32" x="15.25" y="24" drill="1" diameter="1.9304"/>
<pad name="31" x="17.79" y="24" drill="1" diameter="1.9304"/>
<pad name="30" x="20.33" y="24" drill="1" diameter="1.9304"/>
<pad name="29" x="22.87" y="24" drill="1" diameter="1.9304"/>
<pad name="28" x="25.41" y="24" drill="1" diameter="1.9304"/>
<pad name="27" x="27.95" y="24" drill="1" diameter="1.9304"/>
<pad name="26" x="30.49" y="24" drill="1" diameter="1.9304"/>
<pad name="25" x="33.03" y="24" drill="1" diameter="1.9304"/>
<pad name="24" x="35.57" y="24" drill="1" diameter="1.9304"/>
<pad name="23" x="38.11" y="24" drill="1" diameter="1.9304"/>
<pad name="22" x="40.65" y="24" drill="1" diameter="1.9304"/>
<pad name="21" x="43.19" y="24" drill="1" diameter="1.9304"/>
<pad name="20" x="45.73" y="24" drill="1" diameter="1.9304"/>
<wire x1="0.92" y1="17.82" x2="0.92" y2="13.98" width="0.4064" layer="21"/>
<wire x1="0.92" y1="13.98" x2="6.04" y2="13.98" width="0.4064" layer="21"/>
<wire x1="6.04" y1="13.98" x2="6.04" y2="12.7" width="0.4064" layer="21"/>
<wire x1="6.04" y1="12.7" x2="0.92" y2="12.7" width="0.4064" layer="21"/>
<wire x1="0.92" y1="12.7" x2="0.92" y2="11.42" width="0.4064" layer="21"/>
<wire x1="0.92" y1="11.42" x2="6.04" y2="11.42" width="0.4064" layer="21"/>
<wire x1="6.04" y1="11.42" x2="6.04" y2="10.14" width="0.4064" layer="21"/>
<wire x1="6.04" y1="10.14" x2="0.92" y2="10.14" width="0.4064" layer="21"/>
<wire x1="0.92" y1="10.14" x2="0.92" y2="8.86" width="0.4064" layer="21"/>
<wire x1="0.92" y1="8.86" x2="6.04" y2="8.86" width="0.4064" layer="21"/>
<wire x1="6.04" y1="8.86" x2="6.04" y2="7.58" width="0.4064" layer="21"/>
<wire x1="6.04" y1="7.58" x2="0.92" y2="7.58" width="0.4064" layer="21"/>
<wire x1="0.92" y1="7.58" x2="0.92" y2="6.3" width="0.4064" layer="21"/>
<wire x1="0.92" y1="6.3" x2="8.6" y2="6.3" width="0.4064" layer="21"/>
<wire x1="8.6" y1="6.3" x2="8.6" y2="12.7" width="0.4064" layer="21"/>
<text x="0.67" y="1.92" size="1.016" layer="21" rot="R90">3V3</text>
<text x="3.21" y="1.92" size="1.016" layer="21" rot="R90">EN</text>
<text x="5.75" y="1.92" size="1.016" layer="21" rot="R90">SVP</text>
<text x="8.29" y="1.92" size="1.016" layer="21" rot="R90">SVN</text>
<text x="10.83" y="1.92" size="1.016" layer="21" rot="R90">IO34</text>
<text x="13.37" y="1.92" size="1.016" layer="21" rot="R90">IO35</text>
<text x="15.91" y="1.92" size="1.016" layer="21" rot="R90">IO32</text>
<text x="18.45" y="1.92" size="1.016" layer="21" rot="R90">IO33</text>
<text x="20.99" y="1.92" size="1.016" layer="21" rot="R90">IO25</text>
<text x="23.53" y="1.92" size="1.016" layer="21" rot="R90">IO26</text>
<text x="26.07" y="1.92" size="1.016" layer="21" rot="R90">IO27</text>
<text x="28.61" y="1.92" size="1.016" layer="21" rot="R90">IO14</text>
<text x="31.15" y="1.92" size="1.016" layer="21" rot="R90">IO12</text>
<text x="33.69" y="1.92" size="1.016" layer="21" rot="R90">GND</text>
<text x="36.23" y="1.92" size="1.016" layer="21" rot="R90">IO13</text>
<text x="38.77" y="1.92" size="1.016" layer="21" rot="R90">SD2</text>
<text x="41.31" y="1.92" size="1.016" layer="21" rot="R90">SD3</text>
<text x="43.85" y="1.92" size="1.016" layer="21" rot="R90">CMD</text>
<text x="46.39" y="1.92" size="1.016" layer="21" rot="R90">5V</text>
<text x="0.55" y="18.89" size="1.016" layer="21" rot="R90">GND</text>
<text x="3.09" y="18.89" size="1.016" layer="21" rot="R90">IO23</text>
<text x="5.63" y="18.89" size="1.016" layer="21" rot="R90">IO22</text>
<text x="8.17" y="18.89" size="1.016" layer="21" rot="R90">TXD0</text>
<text x="10.71" y="18.89" size="1.016" layer="21" rot="R90">RXD0</text>
<text x="13.25" y="18.89" size="1.016" layer="21" rot="R90">IO21</text>
<text x="15.79" y="18.89" size="1.016" layer="21" rot="R90">GND</text>
<text x="18.33" y="18.89" size="1.016" layer="21" rot="R90">IO19</text>
<text x="20.87" y="18.89" size="1.016" layer="21" rot="R90">IO18</text>
<text x="23.41" y="18.89" size="1.016" layer="21" rot="R90">IO5</text>
<text x="25.95" y="18.89" size="1.016" layer="21" rot="R90">IO17</text>
<text x="28.49" y="18.89" size="1.016" layer="21" rot="R90">IO16</text>
<text x="31.03" y="18.89" size="1.016" layer="21" rot="R90">IO4</text>
<text x="33.57" y="18.89" size="1.016" layer="21" rot="R90">IO0</text>
<text x="36.11" y="18.89" size="1.016" layer="21" rot="R90">IO2</text>
<text x="38.65" y="18.89" size="1.016" layer="21" rot="R90">IO15</text>
<text x="41.19" y="18.89" size="1.016" layer="21" rot="R90">SD1</text>
<text x="43.73" y="18.89" size="1.016" layer="21" rot="R90">SD0</text>
<text x="46.27" y="18.89" size="1.016" layer="21" rot="R90">CLK</text>
<text x="12.84" y="10.78" size="1.9304" layer="21">ESP32-DevkitC (38PINS)</text>
<wire x1="-2.63" y1="26.24" x2="48.13" y2="26.24" width="0.254" layer="21"/>
<wire x1="48.13" y1="26.24" x2="48.13" y2="-2.24" width="0.254" layer="21"/>
<wire x1="48.13" y1="-2.24" x2="-2.63" y2="-2.24" width="0.254" layer="21"/>
<wire x1="-2.63" y1="-2.24" x2="-2.63" y2="26.24" width="0.254" layer="21"/>
</package>
</packages>
<symbols>
<symbol name="ESP32-DEVKITC">
<wire x1="-25.4" y1="-12.7" x2="-25.4" y2="12.7" width="0.254" layer="94"/>
<wire x1="-25.4" y1="12.7" x2="25.4" y2="12.7" width="0.254" layer="94"/>
<wire x1="25.4" y1="12.7" x2="25.4" y2="-12.7" width="0.254" layer="94"/>
<wire x1="25.4" y1="-12.7" x2="-25.4" y2="-12.7" width="0.254" layer="94"/>
<pin name="3V3" x="-22.86" y="-17.78" length="middle" rot="R90"/>
<pin name="EN" x="-20.32" y="-17.78" length="middle" rot="R90"/>
<pin name="SVP" x="-17.78" y="-17.78" length="middle" rot="R90"/>
<pin name="SVN" x="-15.24" y="-17.78" length="middle" rot="R90"/>
<pin name="IO34" x="-12.7" y="-17.78" length="middle" rot="R90"/>
<pin name="IO35" x="-10.16" y="-17.78" length="middle" rot="R90"/>
<pin name="IO32" x="-7.62" y="-17.78" length="middle" rot="R90"/>
<pin name="IO33" x="-5.08" y="-17.78" length="middle" rot="R90"/>
<pin name="IO25" x="-2.54" y="-17.78" length="middle" rot="R90"/>
<pin name="IO26" x="0" y="-17.78" length="middle" rot="R90"/>
<pin name="IO27" x="2.54" y="-17.78" length="middle" rot="R90"/>
<pin name="IO14" x="5.08" y="-17.78" length="middle" rot="R90"/>
<pin name="IO12" x="7.62" y="-17.78" length="middle" rot="R90"/>
<pin name="GND@14" x="10.16" y="-17.78" length="middle" rot="R90"/>
<pin name="IO13" x="12.7" y="-17.78" length="middle" rot="R90"/>
<pin name="SD2" x="15.24" y="-17.78" length="middle" rot="R90"/>
<pin name="SD3" x="17.78" y="-17.78" length="middle" rot="R90"/>
<pin name="CMD" x="20.32" y="-17.78" length="middle" rot="R90"/>
<pin name="5V" x="22.86" y="-17.78" length="middle" rot="R90"/>
<pin name="CLK" x="22.86" y="17.78" length="middle" rot="R270"/>
<pin name="SD0" x="20.32" y="17.78" length="middle" rot="R270"/>
<pin name="SD1" x="17.78" y="17.78" length="middle" rot="R270"/>
<pin name="IO15" x="15.24" y="17.78" length="middle" rot="R270"/>
<pin name="IO2" x="12.7" y="17.78" length="middle" rot="R270"/>
<pin name="IO0" x="10.16" y="17.78" length="middle" rot="R270"/>
<pin name="IO4" x="7.62" y="17.78" length="middle" rot="R270"/>
<pin name="IO16" x="5.08" y="17.78" length="middle" rot="R270"/>
<pin name="IO17" x="2.54" y="17.78" length="middle" rot="R270"/>
<pin name="IO5" x="0" y="17.78" length="middle" rot="R270"/>
<pin name="IO18" x="-2.54" y="17.78" length="middle" rot="R270"/>
<pin name="IO19" x="-5.08" y="17.78" length="middle" rot="R270"/>
<pin name="GND@32" x="-7.62" y="17.78" length="middle" rot="R270"/>
<pin name="IO21" x="-10.16" y="17.78" length="middle" rot="R270"/>
<pin name="RXD0" x="-12.7" y="17.78" length="middle" rot="R270"/>
<pin name="TXD0" x="-15.24" y="17.78" length="middle" rot="R270"/>
<pin name="IO22" x="-17.78" y="17.78" length="middle" rot="R270"/>
<pin name="IO23" x="-20.32" y="17.78" length="middle" rot="R270"/>
<pin name="GND@38" x="-22.86" y="17.78" length="middle" rot="R270"/>
<text x="27.94" y="-10.16" size="1.27" layer="96" rot="R90">ESP32-DEVKITC (38PINS)</text>
</symbol>
</symbols>
<devicesets>
<deviceset name="ESP32DEVKITC" prefix="ESP32-DEVKITC(38PINS)">
<gates>
<gate name="G$1" symbol="ESP32-DEVKITC" x="0" y="0"/>
</gates>
<devices>
<device name="_38PINS" package="ESP32-DEVKITC">
<connects>
<connect gate="G$1" pin="3V3" pad="1"/>
<connect gate="G$1" pin="5V" pad="19"/>
<connect gate="G$1" pin="CLK" pad="20"/>
<connect gate="G$1" pin="CMD" pad="18"/>
<connect gate="G$1" pin="EN" pad="2"/>
<connect gate="G$1" pin="GND@14" pad="14"/>
<connect gate="G$1" pin="GND@32" pad="32"/>
<connect gate="G$1" pin="GND@38" pad="38"/>
<connect gate="G$1" pin="IO0" pad="25"/>
<connect gate="G$1" pin="IO12" pad="13"/>
<connect gate="G$1" pin="IO13" pad="15"/>
<connect gate="G$1" pin="IO14" pad="12"/>
<connect gate="G$1" pin="IO15" pad="23"/>
<connect gate="G$1" pin="IO16" pad="27"/>
<connect gate="G$1" pin="IO17" pad="28"/>
<connect gate="G$1" pin="IO18" pad="30"/>
<connect gate="G$1" pin="IO19" pad="31"/>
<connect gate="G$1" pin="IO2" pad="24"/>
<connect gate="G$1" pin="IO21" pad="33"/>
<connect gate="G$1" pin="IO22" pad="36"/>
<connect gate="G$1" pin="IO23" pad="37"/>
<connect gate="G$1" pin="IO25" pad="9"/>
<connect gate="G$1" pin="IO26" pad="10"/>
<connect gate="G$1" pin="IO27" pad="11"/>
<connect gate="G$1" pin="IO32" pad="7"/>
<connect gate="G$1" pin="IO33" pad="8"/>
<connect gate="G$1" pin="IO34" pad="5"/>
<connect gate="G$1" pin="IO35" pad="6"/>
<connect gate="G$1" pin="IO4" pad="26"/>
<connect gate="G$1" pin="IO5" pad="29"/>
<connect gate="G$1" pin="RXD0" pad="34"/>
<connect gate="G$1" pin="SD0" pad="21"/>
<connect gate="G$1" pin="SD1" pad="22"/>
<connect gate="G$1" pin="SD2" pad="16"/>
<connect gate="G$1" pin="SD3" pad="17"/>
<connect gate="G$1" pin="SVN" pad="4"/>
<connect gate="G$1" pin="SVP" pad="3"/>
<connect gate="G$1" pin="TXD0" pad="35"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="con-molex">
<description>&lt;b&gt;Molex Connectors&lt;/b&gt;&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="22-23-2031">
<description>.100" (2.54mm) Center Header - 3 Pin</description>
<wire x1="-3.81" y1="3.175" x2="3.81" y2="3.175" width="0.254" layer="21"/>
<wire x1="3.81" y1="3.175" x2="3.81" y2="1.27" width="0.254" layer="21"/>
<wire x1="3.81" y1="1.27" x2="3.81" y2="-3.175" width="0.254" layer="21"/>
<wire x1="3.81" y1="-3.175" x2="-3.81" y2="-3.175" width="0.254" layer="21"/>
<wire x1="-3.81" y1="-3.175" x2="-3.81" y2="1.27" width="0.254" layer="21"/>
<wire x1="-3.81" y1="1.27" x2="-3.81" y2="3.175" width="0.254" layer="21"/>
<wire x1="-3.81" y1="1.27" x2="3.81" y2="1.27" width="0.254" layer="21"/>
<pad name="1" x="-2.54" y="0" drill="1" shape="long" rot="R90"/>
<pad name="2" x="0" y="0" drill="1" shape="long" rot="R90"/>
<pad name="3" x="2.54" y="0" drill="1" shape="long" rot="R90"/>
<text x="-3.81" y="3.81" size="1.016" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.81" y="-5.08" size="1.016" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="22-23-2041">
<description>.100" (2.54mm) Center Header - 4 Pin</description>
<wire x1="-5.08" y1="3.175" x2="5.08" y2="3.175" width="0.254" layer="21"/>
<wire x1="5.08" y1="3.175" x2="5.08" y2="1.27" width="0.254" layer="21"/>
<wire x1="5.08" y1="1.27" x2="5.08" y2="-3.175" width="0.254" layer="21"/>
<wire x1="5.08" y1="-3.175" x2="-5.08" y2="-3.175" width="0.254" layer="21"/>
<wire x1="-5.08" y1="-3.175" x2="-5.08" y2="1.27" width="0.254" layer="21"/>
<wire x1="-5.08" y1="1.27" x2="-5.08" y2="3.175" width="0.254" layer="21"/>
<wire x1="-5.08" y1="1.27" x2="5.08" y2="1.27" width="0.254" layer="21"/>
<pad name="1" x="-3.81" y="0" drill="1" shape="long" rot="R90"/>
<pad name="2" x="-1.27" y="0" drill="1" shape="long" rot="R90"/>
<pad name="3" x="1.27" y="0" drill="1" shape="long" rot="R90"/>
<pad name="4" x="3.81" y="0" drill="1" shape="long" rot="R90"/>
<text x="-5.08" y="3.81" size="1.016" layer="25" ratio="10">&gt;NAME</text>
<text x="-5.08" y="-5.08" size="1.016" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="22-23-2121">
<description>.100" (2.54mm) Center Header - 12 Pin</description>
<wire x1="-15.24" y1="3.175" x2="15.24" y2="3.175" width="0.254" layer="21"/>
<wire x1="15.24" y1="3.175" x2="15.24" y2="1.27" width="0.254" layer="21"/>
<wire x1="15.24" y1="1.27" x2="15.24" y2="-3.175" width="0.254" layer="21"/>
<wire x1="15.24" y1="-3.175" x2="-15.24" y2="-3.175" width="0.254" layer="21"/>
<wire x1="-15.24" y1="-3.175" x2="-15.24" y2="1.27" width="0.254" layer="21"/>
<wire x1="-15.24" y1="1.27" x2="-15.24" y2="3.175" width="0.254" layer="21"/>
<wire x1="-15.24" y1="1.27" x2="15.24" y2="1.27" width="0.254" layer="21"/>
<pad name="1" x="-13.97" y="0" drill="1" shape="long" rot="R90"/>
<pad name="2" x="-11.43" y="0" drill="1" shape="long" rot="R90"/>
<pad name="3" x="-8.89" y="0" drill="1" shape="long" rot="R90"/>
<pad name="4" x="-6.35" y="0" drill="1" shape="long" rot="R90"/>
<pad name="5" x="-3.81" y="0" drill="1" shape="long" rot="R90"/>
<pad name="6" x="-1.27" y="0" drill="1" shape="long" rot="R90"/>
<pad name="7" x="1.27" y="0" drill="1" shape="long" rot="R90"/>
<pad name="8" x="3.81" y="0" drill="1" shape="long" rot="R90"/>
<pad name="9" x="6.35" y="0" drill="1" shape="long" rot="R90"/>
<pad name="10" x="8.89" y="0" drill="1" shape="long" rot="R90"/>
<pad name="11" x="11.43" y="0" drill="1" shape="long" rot="R90"/>
<pad name="12" x="13.97" y="0" drill="1" shape="long" rot="R90"/>
<text x="-15.24" y="3.81" size="1.016" layer="25" ratio="10">&gt;NAME</text>
<text x="-15.24" y="-5.08" size="1.016" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="22-23-2071">
<description>.100" (2.54mm) Center Header - 7 Pin</description>
<wire x1="-8.89" y1="3.175" x2="8.89" y2="3.175" width="0.254" layer="21"/>
<wire x1="8.89" y1="3.175" x2="8.89" y2="1.27" width="0.254" layer="21"/>
<wire x1="8.89" y1="1.27" x2="8.89" y2="-3.175" width="0.254" layer="21"/>
<wire x1="8.89" y1="-3.175" x2="-8.89" y2="-3.175" width="0.254" layer="21"/>
<wire x1="-8.89" y1="-3.175" x2="-8.89" y2="1.27" width="0.254" layer="21"/>
<wire x1="-8.89" y1="1.27" x2="-8.89" y2="3.175" width="0.254" layer="21"/>
<wire x1="-8.89" y1="1.27" x2="8.89" y2="1.27" width="0.254" layer="21"/>
<pad name="1" x="-7.62" y="0" drill="1" shape="long" rot="R90"/>
<pad name="2" x="-5.08" y="0" drill="1" shape="long" rot="R90"/>
<pad name="3" x="-2.54" y="0" drill="1" shape="long" rot="R90"/>
<pad name="4" x="0" y="0" drill="1" shape="long" rot="R90"/>
<pad name="5" x="2.54" y="0" drill="1" shape="long" rot="R90"/>
<pad name="6" x="5.08" y="0" drill="1" shape="long" rot="R90"/>
<pad name="7" x="7.62" y="0" drill="1" shape="long" rot="R90"/>
<text x="-8.89" y="3.81" size="1.016" layer="25" ratio="10">&gt;NAME</text>
<text x="-8.89" y="-5.08" size="1.016" layer="27" ratio="10">&gt;VALUE</text>
</package>
</packages>
<symbols>
<symbol name="MV">
<wire x1="1.27" y1="0" x2="0" y2="0" width="0.6096" layer="94"/>
<text x="2.54" y="-0.762" size="1.524" layer="95">&gt;NAME</text>
<text x="-0.762" y="1.397" size="1.778" layer="96">&gt;VALUE</text>
<pin name="S" x="-2.54" y="0" visible="off" length="short" direction="pas"/>
</symbol>
<symbol name="M">
<wire x1="1.27" y1="0" x2="0" y2="0" width="0.6096" layer="94"/>
<text x="2.54" y="-0.762" size="1.524" layer="95">&gt;NAME</text>
<pin name="S" x="-2.54" y="0" visible="off" length="short" direction="pas"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="22-23-2031" prefix="X">
<description>.100" (2.54mm) Center Header - 3 Pin</description>
<gates>
<gate name="-1" symbol="MV" x="0" y="2.54" addlevel="always" swaplevel="1"/>
<gate name="-2" symbol="M" x="0" y="0" addlevel="always" swaplevel="1"/>
<gate name="-3" symbol="M" x="0" y="-2.54" addlevel="always" swaplevel="1"/>
</gates>
<devices>
<device name="" package="22-23-2031">
<connects>
<connect gate="-1" pin="S" pad="1"/>
<connect gate="-2" pin="S" pad="2"/>
<connect gate="-3" pin="S" pad="3"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="MOLEX" constant="no"/>
<attribute name="MPN" value="22-23-2031" constant="no"/>
<attribute name="OC_FARNELL" value="1462950" constant="no"/>
<attribute name="OC_NEWARK" value="30C0862" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="22-23-2041" prefix="X">
<description>.100" (2.54mm) Center Header - 4 Pin</description>
<gates>
<gate name="-1" symbol="MV" x="0" y="2.54" addlevel="always" swaplevel="1"/>
<gate name="-2" symbol="M" x="0" y="0" addlevel="always" swaplevel="1"/>
<gate name="-3" symbol="M" x="0" y="-2.54" addlevel="always" swaplevel="1"/>
<gate name="-4" symbol="M" x="0" y="-5.08" addlevel="always" swaplevel="1"/>
</gates>
<devices>
<device name="" package="22-23-2041">
<connects>
<connect gate="-1" pin="S" pad="1"/>
<connect gate="-2" pin="S" pad="2"/>
<connect gate="-3" pin="S" pad="3"/>
<connect gate="-4" pin="S" pad="4"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="MOLEX" constant="no"/>
<attribute name="MPN" value="22-23-2041" constant="no"/>
<attribute name="OC_FARNELL" value="1462920" constant="no"/>
<attribute name="OC_NEWARK" value="38C0355" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="22-23-2121" prefix="X">
<description>.100" (2.54mm) Center Header - 12 Pin</description>
<gates>
<gate name="-1" symbol="MV" x="0" y="12.7" addlevel="always" swaplevel="1"/>
<gate name="-2" symbol="M" x="0" y="10.16" addlevel="always" swaplevel="1"/>
<gate name="-3" symbol="M" x="0" y="7.62" addlevel="always" swaplevel="1"/>
<gate name="-4" symbol="M" x="0" y="5.08" addlevel="always" swaplevel="1"/>
<gate name="-5" symbol="M" x="0" y="2.54" addlevel="always" swaplevel="1"/>
<gate name="-6" symbol="M" x="0" y="0" addlevel="always" swaplevel="1"/>
<gate name="-7" symbol="M" x="0" y="-2.54" addlevel="always" swaplevel="1"/>
<gate name="-8" symbol="M" x="0" y="-5.08" addlevel="always" swaplevel="1"/>
<gate name="-9" symbol="M" x="0" y="-7.62" addlevel="always" swaplevel="1"/>
<gate name="-10" symbol="M" x="0" y="-10.16" addlevel="always" swaplevel="1"/>
<gate name="-11" symbol="M" x="0" y="-12.7" addlevel="always" swaplevel="1"/>
<gate name="-12" symbol="M" x="0" y="-15.24" addlevel="always" swaplevel="1"/>
</gates>
<devices>
<device name="" package="22-23-2121">
<connects>
<connect gate="-1" pin="S" pad="1"/>
<connect gate="-10" pin="S" pad="10"/>
<connect gate="-11" pin="S" pad="11"/>
<connect gate="-12" pin="S" pad="12"/>
<connect gate="-2" pin="S" pad="2"/>
<connect gate="-3" pin="S" pad="3"/>
<connect gate="-4" pin="S" pad="4"/>
<connect gate="-5" pin="S" pad="5"/>
<connect gate="-6" pin="S" pad="6"/>
<connect gate="-7" pin="S" pad="7"/>
<connect gate="-8" pin="S" pad="8"/>
<connect gate="-9" pin="S" pad="9"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="MOLEX" constant="no"/>
<attribute name="MPN" value="22-23-2121" constant="no"/>
<attribute name="OC_FARNELL" value="1462935" constant="no"/>
<attribute name="OC_NEWARK" value="56H0456" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="22-23-2071" prefix="X">
<description>.100" (2.54mm) Center Header - 7 Pin</description>
<gates>
<gate name="-1" symbol="MV" x="0" y="7.62" addlevel="always" swaplevel="1"/>
<gate name="-2" symbol="M" x="0" y="5.08" addlevel="always" swaplevel="1"/>
<gate name="-3" symbol="M" x="0" y="2.54" addlevel="always" swaplevel="1"/>
<gate name="-4" symbol="M" x="0" y="0" addlevel="always" swaplevel="1"/>
<gate name="-5" symbol="M" x="0" y="-2.54" addlevel="always" swaplevel="1"/>
<gate name="-6" symbol="M" x="0" y="-5.08" addlevel="always" swaplevel="1"/>
<gate name="-7" symbol="M" x="0" y="-7.62" addlevel="always" swaplevel="1"/>
</gates>
<devices>
<device name="" package="22-23-2071">
<connects>
<connect gate="-1" pin="S" pad="1"/>
<connect gate="-2" pin="S" pad="2"/>
<connect gate="-3" pin="S" pad="3"/>
<connect gate="-4" pin="S" pad="4"/>
<connect gate="-5" pin="S" pad="5"/>
<connect gate="-6" pin="S" pad="6"/>
<connect gate="-7" pin="S" pad="7"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="MOLEX" constant="no"/>
<attribute name="MPN" value="22-23-2071" constant="no"/>
<attribute name="OC_FARNELL" value="1654534" constant="no"/>
<attribute name="OC_NEWARK" value="56H0445" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="switch-omron">
<description>&lt;b&gt;Omron Switches&lt;/b&gt;&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="B3F-10XX">
<description>&lt;b&gt;OMRON SWITCH&lt;/b&gt;</description>
<wire x1="3.302" y1="-0.762" x2="3.048" y2="-0.762" width="0.1524" layer="21"/>
<wire x1="3.302" y1="-0.762" x2="3.302" y2="0.762" width="0.1524" layer="21"/>
<wire x1="3.048" y1="0.762" x2="3.302" y2="0.762" width="0.1524" layer="21"/>
<wire x1="3.048" y1="1.016" x2="3.048" y2="2.54" width="0.1524" layer="51"/>
<wire x1="-3.302" y1="0.762" x2="-3.048" y2="0.762" width="0.1524" layer="21"/>
<wire x1="-3.302" y1="0.762" x2="-3.302" y2="-0.762" width="0.1524" layer="21"/>
<wire x1="-3.048" y1="-0.762" x2="-3.302" y2="-0.762" width="0.1524" layer="21"/>
<wire x1="3.048" y1="2.54" x2="2.54" y2="3.048" width="0.1524" layer="51"/>
<wire x1="2.54" y1="-3.048" x2="3.048" y2="-2.54" width="0.1524" layer="51"/>
<wire x1="3.048" y1="-2.54" x2="3.048" y2="-1.016" width="0.1524" layer="51"/>
<wire x1="-2.54" y1="3.048" x2="-3.048" y2="2.54" width="0.1524" layer="51"/>
<wire x1="-3.048" y1="2.54" x2="-3.048" y2="1.016" width="0.1524" layer="51"/>
<wire x1="-2.54" y1="-3.048" x2="-3.048" y2="-2.54" width="0.1524" layer="51"/>
<wire x1="-3.048" y1="-2.54" x2="-3.048" y2="-1.016" width="0.1524" layer="51"/>
<wire x1="-1.27" y1="1.27" x2="-1.27" y2="-1.27" width="0.0508" layer="51"/>
<wire x1="1.27" y1="-1.27" x2="-1.27" y2="-1.27" width="0.0508" layer="51"/>
<wire x1="1.27" y1="-1.27" x2="1.27" y2="1.27" width="0.0508" layer="51"/>
<wire x1="-1.27" y1="1.27" x2="1.27" y2="1.27" width="0.0508" layer="51"/>
<wire x1="-1.27" y1="3.048" x2="-1.27" y2="2.794" width="0.0508" layer="21"/>
<wire x1="1.27" y1="2.794" x2="-1.27" y2="2.794" width="0.0508" layer="21"/>
<wire x1="1.27" y1="2.794" x2="1.27" y2="3.048" width="0.0508" layer="21"/>
<wire x1="1.143" y1="-2.794" x2="-1.27" y2="-2.794" width="0.0508" layer="21"/>
<wire x1="1.143" y1="-2.794" x2="1.143" y2="-3.048" width="0.0508" layer="21"/>
<wire x1="-1.27" y1="-2.794" x2="-1.27" y2="-3.048" width="0.0508" layer="21"/>
<wire x1="2.54" y1="-3.048" x2="2.159" y2="-3.048" width="0.1524" layer="51"/>
<wire x1="-2.54" y1="-3.048" x2="-2.159" y2="-3.048" width="0.1524" layer="51"/>
<wire x1="-2.159" y1="-3.048" x2="-1.27" y2="-3.048" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="3.048" x2="-2.159" y2="3.048" width="0.1524" layer="51"/>
<wire x1="2.54" y1="3.048" x2="2.159" y2="3.048" width="0.1524" layer="51"/>
<wire x1="2.159" y1="3.048" x2="1.27" y2="3.048" width="0.1524" layer="21"/>
<wire x1="1.27" y1="3.048" x2="-1.27" y2="3.048" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="3.048" x2="-2.159" y2="3.048" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="-3.048" x2="1.143" y2="-3.048" width="0.1524" layer="21"/>
<wire x1="1.143" y1="-3.048" x2="2.159" y2="-3.048" width="0.1524" layer="21"/>
<wire x1="3.048" y1="-0.762" x2="3.048" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="3.048" y1="0.762" x2="3.048" y2="1.016" width="0.1524" layer="21"/>
<wire x1="-3.048" y1="-0.762" x2="-3.048" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="-3.048" y1="0.762" x2="-3.048" y2="1.016" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="-2.159" x2="1.27" y2="-2.159" width="0.1524" layer="51"/>
<wire x1="1.27" y1="2.286" x2="-1.27" y2="2.286" width="0.1524" layer="51"/>
<wire x1="-2.413" y1="1.27" x2="-2.413" y2="0.508" width="0.1524" layer="51"/>
<wire x1="-2.413" y1="-0.508" x2="-2.413" y2="-1.27" width="0.1524" layer="51"/>
<wire x1="-2.413" y1="0.508" x2="-2.159" y2="-0.381" width="0.1524" layer="51"/>
<circle x="0" y="0" radius="1.778" width="0.1524" layer="21"/>
<circle x="-2.159" y="-2.159" radius="0.508" width="0.1524" layer="51"/>
<circle x="2.159" y="-2.032" radius="0.508" width="0.1524" layer="51"/>
<circle x="2.159" y="2.159" radius="0.508" width="0.1524" layer="51"/>
<circle x="-2.159" y="2.159" radius="0.508" width="0.1524" layer="51"/>
<circle x="0" y="0" radius="0.635" width="0.0508" layer="51"/>
<circle x="0" y="0" radius="0.254" width="0.1524" layer="21"/>
<pad name="1" x="-3.2512" y="2.2606" drill="1.016" shape="long"/>
<pad name="3" x="-3.2512" y="-2.2606" drill="1.016" shape="long"/>
<pad name="2" x="3.2512" y="2.2606" drill="1.016" shape="long"/>
<pad name="4" x="3.2512" y="-2.2606" drill="1.016" shape="long"/>
<text x="-3.048" y="3.683" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.048" y="-5.08" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<text x="-4.318" y="1.651" size="1.27" layer="51" ratio="10">1</text>
<text x="3.556" y="1.524" size="1.27" layer="51" ratio="10">2</text>
<text x="-4.572" y="-2.794" size="1.27" layer="51" ratio="10">3</text>
<text x="3.556" y="-2.794" size="1.27" layer="51" ratio="10">4</text>
</package>
</packages>
<symbols>
<symbol name="TS2">
<wire x1="0" y1="1.905" x2="0" y2="2.54" width="0.254" layer="94"/>
<wire x1="-4.445" y1="1.905" x2="-3.175" y2="1.905" width="0.254" layer="94"/>
<wire x1="-4.445" y1="-1.905" x2="-3.175" y2="-1.905" width="0.254" layer="94"/>
<wire x1="-4.445" y1="1.905" x2="-4.445" y2="0" width="0.254" layer="94"/>
<wire x1="-4.445" y1="0" x2="-4.445" y2="-1.905" width="0.254" layer="94"/>
<wire x1="-2.54" y1="0" x2="-1.905" y2="0" width="0.1524" layer="94"/>
<wire x1="-1.27" y1="0" x2="-0.635" y2="0" width="0.1524" layer="94"/>
<wire x1="-4.445" y1="0" x2="-3.175" y2="0" width="0.1524" layer="94"/>
<wire x1="2.54" y1="2.54" x2="0" y2="2.54" width="0.1524" layer="94"/>
<wire x1="2.54" y1="-2.54" x2="0" y2="-2.54" width="0.1524" layer="94"/>
<wire x1="0" y1="-2.54" x2="-1.27" y2="1.905" width="0.254" layer="94"/>
<circle x="0" y="-2.54" radius="0.127" width="0.4064" layer="94"/>
<circle x="0" y="2.54" radius="0.127" width="0.4064" layer="94"/>
<text x="-6.35" y="-2.54" size="1.778" layer="95" rot="R90">&gt;NAME</text>
<text x="-3.81" y="3.175" size="1.778" layer="96" rot="R90">&gt;VALUE</text>
<pin name="P" x="0" y="-5.08" visible="pad" length="short" direction="pas" swaplevel="2" rot="R90"/>
<pin name="S" x="0" y="5.08" visible="pad" length="short" direction="pas" swaplevel="1" rot="R270"/>
<pin name="S1" x="2.54" y="5.08" visible="pad" length="short" direction="pas" swaplevel="1" rot="R270"/>
<pin name="P1" x="2.54" y="-5.08" visible="pad" length="short" direction="pas" swaplevel="2" rot="R90"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="10-XX" prefix="S" uservalue="yes">
<description>&lt;b&gt;OMRON SWITCH&lt;/b&gt;</description>
<gates>
<gate name="1" symbol="TS2" x="0" y="0"/>
</gates>
<devices>
<device name="" package="B3F-10XX">
<connects>
<connect gate="1" pin="P" pad="3"/>
<connect gate="1" pin="P1" pad="4"/>
<connect gate="1" pin="S" pad="1"/>
<connect gate="1" pin="S1" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="B3F-1000" constant="no"/>
<attribute name="OC_FARNELL" value="176432" constant="no"/>
<attribute name="OC_NEWARK" value="36M3542" constant="no"/>
</technology>
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
<part name="ESP32-DEVKITC(38PINS)1" library="ESP32-DEVKITC(38PINS)" deviceset="ESP32DEVKITC" device="_38PINS"/>
<part name="X1" library="con-molex" deviceset="22-23-2031" device=""/>
<part name="DISPLAY" library="con-molex" deviceset="22-23-2041" device=""/>
<part name="X3" library="con-molex" deviceset="22-23-2041" device=""/>
<part name="S1" library="switch-omron" deviceset="10-XX" device=""/>
<part name="X2" library="con-molex" deviceset="22-23-2121" device=""/>
<part name="X4" library="con-molex" deviceset="22-23-2121" device=""/>
<part name="X5" library="con-molex" deviceset="22-23-2071" device=""/>
<part name="X6" library="con-molex" deviceset="22-23-2071" device=""/>
</parts>
<sheets>
<sheet>
<plain>
</plain>
<instances>
<instance part="ESP32-DEVKITC(38PINS)1" gate="G$1" x="43.18" y="38.1" rot="R270"/>
<instance part="X1" gate="-1" x="121.92" y="71.12"/>
<instance part="X1" gate="-2" x="121.92" y="68.58"/>
<instance part="X1" gate="-3" x="121.92" y="66.04"/>
<instance part="DISPLAY" gate="-1" x="40.64" y="81.28" rot="R90"/>
<instance part="DISPLAY" gate="-2" x="43.18" y="81.28" rot="R90"/>
<instance part="DISPLAY" gate="-3" x="45.72" y="81.28" rot="R90"/>
<instance part="DISPLAY" gate="-4" x="48.26" y="81.28" rot="R90"/>
<instance part="X3" gate="-1" x="88.9" y="60.96"/>
<instance part="X3" gate="-2" x="88.9" y="58.42"/>
<instance part="X3" gate="-3" x="88.9" y="55.88"/>
<instance part="X3" gate="-4" x="88.9" y="53.34"/>
<instance part="S1" gate="1" x="2.54" y="73.66" rot="R270"/>
<instance part="X2" gate="-1" x="129.54" y="53.34"/>
<instance part="X2" gate="-2" x="129.54" y="50.8"/>
<instance part="X2" gate="-3" x="129.54" y="48.26"/>
<instance part="X2" gate="-4" x="129.54" y="45.72"/>
<instance part="X2" gate="-5" x="129.54" y="43.18"/>
<instance part="X2" gate="-6" x="129.54" y="40.64"/>
<instance part="X2" gate="-7" x="129.54" y="38.1"/>
<instance part="X2" gate="-8" x="129.54" y="35.56"/>
<instance part="X2" gate="-9" x="129.54" y="33.02"/>
<instance part="X2" gate="-10" x="129.54" y="30.48"/>
<instance part="X2" gate="-11" x="129.54" y="27.94"/>
<instance part="X2" gate="-12" x="129.54" y="25.4"/>
<instance part="X4" gate="-1" x="114.3" y="25.4" rot="R180"/>
<instance part="X4" gate="-2" x="114.3" y="27.94" rot="R180"/>
<instance part="X4" gate="-3" x="114.3" y="30.48" rot="R180"/>
<instance part="X4" gate="-4" x="114.3" y="33.02" rot="R180"/>
<instance part="X4" gate="-5" x="114.3" y="35.56" rot="R180"/>
<instance part="X4" gate="-6" x="114.3" y="38.1" rot="R180"/>
<instance part="X4" gate="-7" x="114.3" y="40.64" rot="R180"/>
<instance part="X4" gate="-8" x="114.3" y="43.18" rot="R180"/>
<instance part="X4" gate="-9" x="114.3" y="45.72" rot="R180"/>
<instance part="X4" gate="-10" x="114.3" y="48.26" rot="R180"/>
<instance part="X4" gate="-11" x="114.3" y="50.8" rot="R180"/>
<instance part="X4" gate="-12" x="114.3" y="53.34" rot="R180"/>
<instance part="X5" gate="-1" x="129.54" y="22.86"/>
<instance part="X5" gate="-2" x="129.54" y="20.32"/>
<instance part="X5" gate="-3" x="129.54" y="17.78"/>
<instance part="X5" gate="-4" x="129.54" y="15.24"/>
<instance part="X5" gate="-5" x="129.54" y="12.7"/>
<instance part="X5" gate="-6" x="129.54" y="10.16"/>
<instance part="X5" gate="-7" x="129.54" y="7.62"/>
<instance part="X6" gate="-1" x="114.3" y="7.62" rot="R180"/>
<instance part="X6" gate="-2" x="114.3" y="10.16" rot="R180"/>
<instance part="X6" gate="-3" x="114.3" y="12.7" rot="R180"/>
<instance part="X6" gate="-4" x="114.3" y="15.24" rot="R180"/>
<instance part="X6" gate="-5" x="114.3" y="17.78" rot="R180"/>
<instance part="X6" gate="-6" x="114.3" y="20.32" rot="R180"/>
<instance part="X6" gate="-7" x="114.3" y="22.86" rot="R180"/>
</instances>
<busses>
</busses>
<nets>
<net name="VCC" class="0">
<segment>
<pinref part="DISPLAY" gate="-2" pin="S"/>
<wire x1="43.18" y1="78.74" x2="43.18" y2="76.2" width="0.1524" layer="91"/>
<label x="43.18" y="76.2" size="1.778" layer="95" rot="R270" xref="yes"/>
</segment>
<segment>
<pinref part="ESP32-DEVKITC(38PINS)1" gate="G$1" pin="3V3"/>
<wire x1="25.4" y1="60.96" x2="22.86" y2="60.96" width="0.1524" layer="91"/>
<label x="22.86" y="60.96" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="X1" gate="-3" pin="S"/>
<wire x1="119.38" y1="66.04" x2="116.84" y2="66.04" width="0.1524" layer="91"/>
<label x="116.84" y="66.04" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="X3" gate="-4" pin="S"/>
<wire x1="86.36" y1="53.34" x2="83.82" y2="53.34" width="0.1524" layer="91"/>
<label x="83.82" y="53.34" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
</net>
<net name="SDA" class="0">
<segment>
<pinref part="DISPLAY" gate="-4" pin="S"/>
<wire x1="48.26" y1="78.74" x2="48.26" y2="76.2" width="0.1524" layer="91"/>
<label x="48.26" y="76.2" size="1.778" layer="95" rot="R270" xref="yes"/>
</segment>
<segment>
<pinref part="ESP32-DEVKITC(38PINS)1" gate="G$1" pin="IO33"/>
<wire x1="25.4" y1="43.18" x2="22.86" y2="43.18" width="0.1524" layer="91"/>
<label x="22.86" y="43.18" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
</net>
<net name="GND" class="0">
<segment>
<pinref part="DISPLAY" gate="-1" pin="S"/>
<wire x1="40.64" y1="78.74" x2="40.64" y2="76.2" width="0.1524" layer="91"/>
<label x="40.64" y="76.2" size="1.778" layer="95" rot="R270" xref="yes"/>
</segment>
<segment>
<pinref part="ESP32-DEVKITC(38PINS)1" gate="G$1" pin="GND@38"/>
<wire x1="60.96" y1="60.96" x2="63.5" y2="60.96" width="0.1524" layer="91"/>
<label x="63.5" y="60.96" size="1.778" layer="95" xref="yes"/>
</segment>
<segment>
<pinref part="S1" gate="1" pin="S1"/>
<wire x1="7.62" y1="71.12" x2="10.16" y2="71.12" width="0.1524" layer="91"/>
<label x="10.16" y="71.12" size="1.778" layer="95" xref="yes"/>
</segment>
<segment>
<pinref part="X1" gate="-1" pin="S"/>
<wire x1="119.38" y1="71.12" x2="116.84" y2="71.12" width="0.1524" layer="91"/>
<label x="116.84" y="71.12" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="X3" gate="-1" pin="S"/>
<wire x1="86.36" y1="60.96" x2="83.82" y2="60.96" width="0.1524" layer="91"/>
<label x="83.82" y="60.96" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="ESP32-DEVKITC(38PINS)1" gate="G$1" pin="GND@14"/>
<wire x1="25.4" y1="27.94" x2="22.86" y2="27.94" width="0.1524" layer="91"/>
<label x="22.86" y="27.94" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="ESP32-DEVKITC(38PINS)1" gate="G$1" pin="GND@32"/>
<wire x1="60.96" y1="45.72" x2="63.5" y2="45.72" width="0.1524" layer="91"/>
<label x="63.5" y="45.72" size="1.778" layer="95" xref="yes"/>
</segment>
</net>
<net name="SCL" class="0">
<segment>
<pinref part="DISPLAY" gate="-3" pin="S"/>
<wire x1="45.72" y1="78.74" x2="45.72" y2="76.2" width="0.1524" layer="91"/>
<label x="45.72" y="76.2" size="1.778" layer="95" rot="R270" xref="yes"/>
</segment>
<segment>
<pinref part="ESP32-DEVKITC(38PINS)1" gate="G$1" pin="IO32"/>
<wire x1="25.4" y1="45.72" x2="22.86" y2="45.72" width="0.1524" layer="91"/>
<label x="22.86" y="45.72" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
</net>
<net name="G2" class="0">
<segment>
<pinref part="X1" gate="-2" pin="S"/>
<wire x1="119.38" y1="68.58" x2="116.84" y2="68.58" width="0.1524" layer="91"/>
<label x="116.84" y="68.58" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="ESP32-DEVKITC(38PINS)1" gate="G$1" pin="IO2"/>
<wire x1="60.96" y1="25.4" x2="63.5" y2="25.4" width="0.1524" layer="91"/>
<label x="63.5" y="25.4" size="1.778" layer="95" xref="yes"/>
</segment>
</net>
<net name="N$3" class="0">
<segment>
<pinref part="X3" gate="-2" pin="S"/>
<wire x1="86.36" y1="58.42" x2="83.82" y2="58.42" width="0.1524" layer="91"/>
</segment>
</net>
<net name="G13" class="0">
<segment>
<pinref part="S1" gate="1" pin="P1"/>
<wire x1="-2.54" y1="71.12" x2="-5.08" y2="71.12" width="0.1524" layer="91"/>
<label x="-5.08" y="71.12" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="ESP32-DEVKITC(38PINS)1" gate="G$1" pin="IO13"/>
<wire x1="25.4" y1="25.4" x2="22.86" y2="25.4" width="0.1524" layer="91"/>
<label x="22.86" y="25.4" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
</net>
<net name="G21" class="0">
<segment>
<pinref part="X3" gate="-3" pin="S"/>
<wire x1="86.36" y1="55.88" x2="83.82" y2="55.88" width="0.1524" layer="91"/>
<label x="83.82" y="55.88" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="ESP32-DEVKITC(38PINS)1" gate="G$1" pin="IO21"/>
<wire x1="60.96" y1="48.26" x2="63.5" y2="48.26" width="0.1524" layer="91"/>
<label x="63.5" y="48.26" size="1.778" layer="95" xref="yes"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
</eagle>
