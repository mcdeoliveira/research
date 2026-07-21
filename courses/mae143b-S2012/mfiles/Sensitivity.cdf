(* Content-type: application/vnd.wolfram.cdf.text *)

(*** Wolfram CDF File ***)
(* http://www.wolfram.com/cdf *)

(* CreatedBy='Mathematica 8.0' *)

(*************************************************************************)
(*                                                                       *)
(*  The Mathematica License under which this file was created prohibits  *)
(*  restricting third parties in receipt of this file from republishing  *)
(*  or redistributing it by any means, including but not limited to      *)
(*  rights management or terms of use, without the express consent of    *)
(*  Wolfram Research, Inc.                                               *)
(*                                                                       *)
(*************************************************************************)

(*CacheID: 234*)
(* Internal cache information:
NotebookFileLineBreakTest
NotebookFileLineBreakTest
NotebookDataPosition[       835,         17]
NotebookDataLength[     11244,        454]
NotebookOptionsPosition[      9175,        359]
NotebookOutlinePosition[      9652,        380]
CellTagsIndexPosition[      9609,        377]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{

Cell[CellGroupData[{
Cell["Sensitivity to changes in the system gain", "Section", "PluginEmbeddedContent"],

Cell["Perturbed system is:", "Text", "PluginEmbeddedContent"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"\[Delta]G", "=", 
  RowBox[{"\[Delta]", " ", 
   RowBox[{"G", "[", "s", "]"}]}]}]], "Input", "PluginEmbeddedContent"],

Cell[BoxData[
 RowBox[{"\[Delta]", " ", 
  RowBox[{"G", "[", "s", "]"}]}]], "Output", "PluginEmbeddedContent"]
}, Open  ]],

Cell[CellGroupData[{

Cell["Open-loop Sensitivity", "Subsection", "PluginEmbeddedContent"],

Cell["\<\
We calculate the open-loop sensitivity:\
\>", "Text", "PluginEmbeddedContent"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"\[Delta]S", "=", 
  RowBox[{
   RowBox[{"(", 
    RowBox[{"\[Delta]", "/", "\[Delta]G"}], ")"}], 
   RowBox[{"D", "[", 
    RowBox[{"\[Delta]G", ",", "\[Delta]"}], "]"}]}]}]], "Input", \
"PluginEmbeddedContent"],

Cell[BoxData["1"], "Output", "PluginEmbeddedContent"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["Closed-loop Sensitivity", "Subsection", "PluginEmbeddedContent"],

Cell["\<\
We calculate the closed-loop transfer-function: \
\>", "Text", "PluginEmbeddedContent"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"\[Delta]H", "=", 
  RowBox[{
   RowBox[{"K", "[", "s", "]"}], " ", 
   RowBox[{"\[Delta]G", "/", 
    RowBox[{"(", 
     RowBox[{"1", "+", 
      RowBox[{
       RowBox[{"K", "[", "s", "]"}], " ", "\[Delta]G"}]}], 
     ")"}]}]}]}]], "Input", "PluginEmbeddedContent"],

Cell[BoxData[
 FractionBox[
  RowBox[{"\[Delta]", " ", 
   RowBox[{"G", "[", "s", "]"}], " ", 
   RowBox[{"K", "[", "s", "]"}]}], 
  RowBox[{"1", "+", 
   RowBox[{"\[Delta]", " ", 
    RowBox[{"G", "[", "s", "]"}], " ", 
    RowBox[{"K", "[", "s", "]"}]}]}]]], "Output", "PluginEmbeddedContent"]
}, Open  ]],

Cell["\<\
and the closed-loop sensitivity\
\>", "Text", "PluginEmbeddedContent"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"\[Delta]S", "=", 
  RowBox[{
   RowBox[{
    RowBox[{"(", 
     RowBox[{"\[Delta]", "/", "\[Delta]H"}], ")"}], 
    RowBox[{"D", "[", 
     RowBox[{"\[Delta]H", ",", "\[Delta]"}], "]"}]}], "//", 
   "Simplify"}]}]], "Input", "PluginEmbeddedContent"],

Cell[BoxData[
 FractionBox["1", 
  RowBox[{"1", "+", 
   RowBox[{"\[Delta]", " ", 
    RowBox[{"G", "[", "s", "]"}], " ", 
    RowBox[{"K", "[", "s", "]"}]}]}]]], "Output", "PluginEmbeddedContent"]
}, Open  ]]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["\<\
Sensitivity to changes in one system pole\
\>", "Section", "PluginEmbeddedContent"],

Cell["Perturbed system is:", "Text", "PluginEmbeddedContent"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"\[Delta]G", "=", 
  RowBox[{
   RowBox[{"G", "[", "s", "]"}], "/", 
   RowBox[{"(", 
    RowBox[{"s", "-", "\[Delta]"}], ")"}]}]}]], "Input", \
"PluginEmbeddedContent"],

Cell[BoxData[
 FractionBox[
  RowBox[{"G", "[", "s", "]"}], 
  RowBox[{"s", "-", "\[Delta]"}]]], "Output", "PluginEmbeddedContent"]
}, Open  ]],

Cell[CellGroupData[{

Cell["Open-loop Sensitivity", "Subsection", "PluginEmbeddedContent"],

Cell["\<\
We calculate the open-loop sensitivity:\
\>", "Text", "PluginEmbeddedContent"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"\[Delta]S", "=", 
  RowBox[{
   RowBox[{"(", 
    RowBox[{"\[Delta]", "/", "\[Delta]G"}], ")"}], 
   RowBox[{"D", "[", 
    RowBox[{"\[Delta]G", ",", "\[Delta]"}], "]"}]}]}]], "Input", \
"PluginEmbeddedContent"],

Cell[BoxData[
 FractionBox["\[Delta]", 
  RowBox[{"s", "-", "\[Delta]"}]]], "Output", "PluginEmbeddedContent"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["Closed-loop Sensitivity", "Subsection", "PluginEmbeddedContent"],

Cell["\<\
We calculate the closed-loop transfer-function: \
\>", "Text", "PluginEmbeddedContent"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"\[Delta]H", "=", 
  RowBox[{
   RowBox[{
    RowBox[{"K", "[", "s", "]"}], " ", 
    RowBox[{"\[Delta]G", "/", 
     RowBox[{"(", 
      RowBox[{"1", "+", 
       RowBox[{
        RowBox[{"K", "[", "s", "]"}], " ", "\[Delta]G"}]}], ")"}]}]}], "//", 
   "Simplify"}]}]], "Input", "PluginEmbeddedContent"],

Cell[BoxData[
 FractionBox[
  RowBox[{
   RowBox[{"G", "[", "s", "]"}], " ", 
   RowBox[{"K", "[", "s", "]"}]}], 
  RowBox[{"s", "-", "\[Delta]", "+", 
   RowBox[{
    RowBox[{"G", "[", "s", "]"}], " ", 
    RowBox[{"K", "[", "s", "]"}]}]}]]], "Output", "PluginEmbeddedContent"]
}, Open  ]],

Cell["\<\
and the closed-loop sensitivity\
\>", "Text", "PluginEmbeddedContent"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"\[Delta]S", "=", 
  RowBox[{
   RowBox[{
    RowBox[{"(", 
     RowBox[{"\[Delta]", "/", "\[Delta]H"}], ")"}], 
    RowBox[{"D", "[", 
     RowBox[{"\[Delta]H", ",", "\[Delta]"}], "]"}]}], "//", 
   "Simplify"}]}]], "Input", "PluginEmbeddedContent"],

Cell[BoxData[
 FractionBox["\[Delta]", 
  RowBox[{"s", "-", "\[Delta]", "+", 
   RowBox[{
    RowBox[{"G", "[", "s", "]"}], " ", 
    RowBox[{"K", "[", "s", "]"}]}]}]]], "Output", "PluginEmbeddedContent"]
}, Open  ]]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["\<\
Sensitivity to changes in one system repeated pole\
\>", "Section", "PluginEmbeddedContent"],

Cell["Perturbed system is:", "Text", "PluginEmbeddedContent"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"\[Delta]G", "=", 
  RowBox[{
   RowBox[{"G", "[", "s", "]"}], "/", 
   SuperscriptBox[
    RowBox[{"(", 
     RowBox[{"s", "-", "\[Delta]"}], ")"}], "2"]}]}]], "Input", \
"PluginEmbeddedContent"],

Cell[BoxData[
 FractionBox[
  RowBox[{"G", "[", "s", "]"}], 
  SuperscriptBox[
   RowBox[{"(", 
    RowBox[{"s", "-", "\[Delta]"}], ")"}], "2"]]], "Output", \
"PluginEmbeddedContent"]
}, Open  ]],

Cell[CellGroupData[{

Cell["Open-loop Sensitivity", "Subsection", "PluginEmbeddedContent"],

Cell["\<\
We calculate the open-loop sensitivity:\
\>", "Text", "PluginEmbeddedContent"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"\[Delta]S", "=", 
  RowBox[{
   RowBox[{"(", 
    RowBox[{"\[Delta]", "/", "\[Delta]G"}], ")"}], 
   RowBox[{"D", "[", 
    RowBox[{"\[Delta]G", ",", "\[Delta]"}], "]"}]}]}]], "Input", \
"PluginEmbeddedContent"],

Cell[BoxData[
 FractionBox[
  RowBox[{"2", " ", "\[Delta]"}], 
  RowBox[{"s", "-", "\[Delta]"}]]], "Output", "PluginEmbeddedContent"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["Closed-loop Sensitivity", "Subsection", "PluginEmbeddedContent"],

Cell["\<\
We calculate the closed-loop transfer-function: \
\>", "Text", "PluginEmbeddedContent"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"\[Delta]H", "=", 
  RowBox[{
   RowBox[{
    RowBox[{"K", "[", "s", "]"}], " ", 
    RowBox[{"\[Delta]G", "/", 
     RowBox[{"(", 
      RowBox[{"1", "+", 
       RowBox[{
        RowBox[{"K", "[", "s", "]"}], " ", "\[Delta]G"}]}], ")"}]}]}], "//", 
   "Simplify"}]}]], "Input", "PluginEmbeddedContent"],

Cell[BoxData[
 FractionBox[
  RowBox[{
   RowBox[{"G", "[", "s", "]"}], " ", 
   RowBox[{"K", "[", "s", "]"}]}], 
  RowBox[{
   SuperscriptBox[
    RowBox[{"(", 
     RowBox[{"s", "-", "\[Delta]"}], ")"}], "2"], "+", 
   RowBox[{
    RowBox[{"G", "[", "s", "]"}], " ", 
    RowBox[{"K", "[", "s", "]"}]}]}]]], "Output", "PluginEmbeddedContent"]
}, Open  ]],

Cell["\<\
and the closed-loop sensitivity\
\>", "Text", "PluginEmbeddedContent"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"\[Delta]S", "=", 
  RowBox[{
   RowBox[{
    RowBox[{"(", 
     RowBox[{"\[Delta]", "/", "\[Delta]H"}], ")"}], 
    RowBox[{"D", "[", 
     RowBox[{"\[Delta]H", ",", "\[Delta]"}], "]"}]}], "//", 
   "Simplify"}]}]], "Input", "PluginEmbeddedContent"],

Cell[BoxData[
 FractionBox[
  RowBox[{"2", " ", 
   RowBox[{"(", 
    RowBox[{"s", "-", "\[Delta]"}], ")"}], " ", "\[Delta]"}], 
  RowBox[{
   SuperscriptBox[
    RowBox[{"(", 
     RowBox[{"s", "-", "\[Delta]"}], ")"}], "2"], "+", 
   RowBox[{
    RowBox[{"G", "[", "s", "]"}], " ", 
    RowBox[{"K", "[", "s", "]"}]}]}]]], "Output", "PluginEmbeddedContent"]
}, Open  ]]
}, Open  ]]
}, Open  ]]
},
WindowSize->{494.1, 791.},
ScrollingOptions->{"HorizontalScrollRange"->Fit,
"VerticalScrollRange"->Fit},
ShowCellBracket->False,
Deployed->True,
CellContext->Notebook,
TrackCellChangeTimes->False,
FrontEndVersion->"8.0 for Mac OS X x86 (32-bit, 64-bit Kernel) (October 5, \
2011)",
StyleDefinitions->"Default.nb"
]
(* End of Notebook Content *)

(* Internal cache information *)
(*CellTagsOutline
CellTagsIndex->{}
*)
(*CellTagsIndex
CellTagsIndex->{}
*)
(*NotebookFileOutline
Notebook[{
Cell[CellGroupData[{
Cell[1257, 32, 85, 0, 25, "Section"],
Cell[1345, 34, 61, 0, 12, "Text"],
Cell[CellGroupData[{
Cell[1431, 38, 141, 3, 12, "Input"],
Cell[1575, 43, 110, 2, 12, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[1722, 50, 68, 0, 14, "Subsection"],
Cell[1793, 52, 88, 2, 12, "Text"],
Cell[CellGroupData[{
Cell[1906, 58, 235, 7, 12, "Input"],
Cell[2144, 67, 53, 0, 12, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[2246, 73, 70, 0, 14, "Subsection"],
Cell[2319, 75, 97, 2, 12, "Text"],
Cell[CellGroupData[{
Cell[2441, 81, 291, 9, 12, "Input"],
Cell[2735, 92, 295, 8, 33, "Output"]
}, Open  ]],
Cell[3045, 103, 80, 2, 12, "Text"],
Cell[CellGroupData[{
Cell[3150, 109, 273, 8, 12, "Input"],
Cell[3426, 119, 197, 5, 33, "Output"]
}, Open  ]]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[3684, 131, 93, 2, 25, "Section"],
Cell[3780, 135, 61, 0, 12, "Text"],
Cell[CellGroupData[{
Cell[3866, 139, 192, 6, 12, "Input"],
Cell[4061, 147, 131, 3, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[4229, 155, 68, 0, 14, "Subsection"],
Cell[4300, 157, 88, 2, 12, "Text"],
Cell[CellGroupData[{
Cell[4413, 163, 235, 7, 12, "Input"],
Cell[4651, 172, 110, 2, 32, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[4810, 180, 70, 0, 14, "Subsection"],
Cell[4883, 182, 97, 2, 12, "Text"],
Cell[CellGroupData[{
Cell[5005, 188, 327, 10, 12, "Input"],
Cell[5335, 200, 278, 8, 32, "Output"]
}, Open  ]],
Cell[5628, 211, 80, 2, 12, "Text"],
Cell[CellGroupData[{
Cell[5733, 217, 273, 8, 12, "Input"],
Cell[6009, 227, 204, 5, 33, "Output"]
}, Open  ]]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[6274, 239, 102, 2, 25, "Section"],
Cell[6379, 243, 61, 0, 12, "Text"],
Cell[CellGroupData[{
Cell[6465, 247, 219, 7, 18, "Input"],
Cell[6687, 256, 183, 6, 34, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[6907, 267, 68, 0, 14, "Subsection"],
Cell[6978, 269, 88, 2, 12, "Text"],
Cell[CellGroupData[{
Cell[7091, 275, 235, 7, 12, "Input"],
Cell[7329, 284, 133, 3, 32, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[7511, 293, 70, 0, 14, "Subsection"],
Cell[7584, 295, 97, 2, 12, "Text"],
Cell[CellGroupData[{
Cell[7706, 301, 327, 10, 12, "Input"],
Cell[8036, 313, 344, 11, 34, "Output"]
}, Open  ]],
Cell[8395, 327, 80, 2, 12, "Text"],
Cell[CellGroupData[{
Cell[8500, 333, 273, 8, 12, "Input"],
Cell[8776, 343, 359, 11, 35, "Output"]
}, Open  ]]
}, Open  ]]
}, Open  ]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature QupH4Krc7tKujA1e10TNEOCh *)
