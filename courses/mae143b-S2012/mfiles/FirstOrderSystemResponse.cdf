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
NotebookDataLength[     12876,        392]
NotebookOptionsPosition[     11847,        334]
NotebookOutlinePosition[     12361,        356]
CellTagsIndexPosition[     12318,        353]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{

Cell[CellGroupData[{
Cell["System Response", "Title", "PluginEmbeddedContent"],

Cell["MAE 143 B", "Subsubtitle", "PluginEmbeddedContent"],

Cell["Mauricio de Oliveira", "Subsubtitle", "PluginEmbeddedContent"],

Cell[CellGroupData[{

Cell["First-order system", "Section", "PluginEmbeddedContent"],

Cell[CellGroupData[{

Cell["Impulse Response", "Subsection", "PluginEmbeddedContent"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"G", "=", 
  RowBox[{"b", "/", 
   RowBox[{"(", 
    RowBox[{"s", "+", "a"}], ")"}]}]}]], "Input", "PluginEmbeddedContent"],

Cell[BoxData[
 FractionBox["b", 
  RowBox[{"a", "+", "s"}]]], "Output", "PluginEmbeddedContent"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"InverseLaplaceTransform", "[", 
  RowBox[{"G", ",", "s", ",", "t"}], "]"}]], "Input", "PluginEmbeddedContent"],

Cell[BoxData[
 RowBox[{"b", " ", 
  SuperscriptBox["\[ExponentialE]", 
   RowBox[{
    RowBox[{"-", "a"}], " ", "t"}]]}]], "Output", "PluginEmbeddedContent"]
}, Open  ]],

Cell["\<\
Experiment with the impulse response in the interactive plot.
Try a = 0 as well as negatives values of a and b.\
\>", "Text", "PluginEmbeddedContent",
 FontSize->16],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Manipulate", "[", "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Plot", "[", "\[IndentingNewLine]", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"b", " ", 
       RowBox[{"Exp", "[", 
        RowBox[{
         RowBox[{"-", "a"}], " ", "t"}], "]"}]}], "}"}], 
     "\[IndentingNewLine]", ",", "\[IndentingNewLine]", 
     RowBox[{"{", 
      RowBox[{"t", ",", "0", ",", "10"}], "}"}], ",", "\[IndentingNewLine]", 
     RowBox[{"PlotStyle", "\[Rule]", 
      RowBox[{"{", "Blue", "}"}]}], ",", "\[IndentingNewLine]", 
     RowBox[{"PlotRange", "\[Rule]", "All"}], ",", "\[IndentingNewLine]", 
     RowBox[{"GridLines", "\[Rule]", "Automatic"}], ",", 
     "\[IndentingNewLine]", 
     RowBox[{"Frame", "\[Rule]", "True"}], ",", "\[IndentingNewLine]", 
     RowBox[{"FrameLabel", "\[Rule]", 
      RowBox[{"{", "\[IndentingNewLine]", 
       RowBox[{
        RowBox[{"{", 
         RowBox[{"\"\<y\>\"", ",", "\"\<\>\""}], "}"}], ",", 
        "\[IndentingNewLine]", 
        RowBox[{"{", 
         RowBox[{"\"\<t\>\"", ",", 
          RowBox[{"\"\<a = \>\"", "<>", 
           RowBox[{"ToString", "[", "a", "]"}]}]}], "}"}]}], 
       "\[IndentingNewLine]", "}"}]}]}], "\[IndentingNewLine]", "]"}], 
   "\[IndentingNewLine]", ",", "\[IndentingNewLine]", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"a", ",", "1", ",", "\"\<a\>\""}], "}"}], ",", 
     RowBox[{"-", "2"}], ",", "2"}], "}"}], ",", "\[IndentingNewLine]", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"b", ",", "1", ",", "\"\<b\>\""}], "}"}], ",", 
     RowBox[{"-", "2"}], ",", "2"}], "}"}]}], "\[IndentingNewLine]", 
  "]"}]], "Input", "PluginEmbeddedContent",
 CellOpen->False],

Cell[BoxData[
 TagBox[
  StyleBox[
   DynamicModuleBox[{$CellContext`a$$ = 1, $CellContext`b$$ = 1, 
    Typeset`show$$ = True, Typeset`bookmarkList$$ = {}, 
    Typeset`bookmarkMode$$ = "Menu", Typeset`animator$$, Typeset`animvar$$ = 
    1, Typeset`name$$ = "\"untitled\"", Typeset`specs$$ = {{{
       Hold[$CellContext`a$$], 1, "a"}, -2, 2}, {{
       Hold[$CellContext`b$$], 1, "b"}, -2, 2}}, Typeset`size$$ = {
    360., {117., 122.}}, Typeset`update$$ = 0, Typeset`initDone$$, 
    Typeset`skipInitDone$$ = True, $CellContext`a$105$$ = 
    0, $CellContext`b$110$$ = 0}, 
    DynamicBox[Manipulate`ManipulateBoxes[
     1, StandardForm, 
      "Variables" :> {$CellContext`a$$ = 1, $CellContext`b$$ = 1}, 
      "ControllerVariables" :> {
        Hold[$CellContext`a$$, $CellContext`a$105$$, 0], 
        Hold[$CellContext`b$$, $CellContext`b$110$$, 0]}, 
      "OtherVariables" :> {
       Typeset`show$$, Typeset`bookmarkList$$, Typeset`bookmarkMode$$, 
        Typeset`animator$$, Typeset`animvar$$, Typeset`name$$, 
        Typeset`specs$$, Typeset`size$$, Typeset`update$$, Typeset`initDone$$,
         Typeset`skipInitDone$$}, "Body" :> 
      Plot[{$CellContext`b$$ 
         Exp[(-$CellContext`a$$) $CellContext`t]}, {$CellContext`t, 0, 10}, 
        PlotStyle -> {Blue}, PlotRange -> All, GridLines -> Automatic, Frame -> 
        True, FrameLabel -> {{"y", ""}, {"t", 
           StringJoin["a = ", 
            ToString[$CellContext`a$$]]}}], 
      "Specifications" :> {{{$CellContext`a$$, 1, "a"}, -2, 
         2}, {{$CellContext`b$$, 1, "b"}, -2, 2}}, "Options" :> {}, 
      "DefaultOptions" :> {}],
     ImageSizeCache->{403., {173., 179.}},
     SingleEvaluation->True],
    Deinitialization:>None,
    DynamicModuleValues:>{},
    SynchronousInitialization->True,
    UnsavedVariables:>{Typeset`initDone$$},
    UntrackedVariables:>{Typeset`size$$}], "Manipulate",
   Deployed->True,
   StripOnInput->False],
  Manipulate`InterpretManipulate[1]]], "Output", "PluginEmbeddedContent"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["Step Response", "Subsection", "PluginEmbeddedContent"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Collect", "[", 
  RowBox[{
   RowBox[{"InverseLaplaceTransform", "[", 
    RowBox[{
     RowBox[{"G", "/", "s"}], ",", "s", ",", "t"}], "]"}], ",", 
   RowBox[{"{", 
    RowBox[{"a", ",", "b"}], "}"}]}], "]"}]], "Input", \
"PluginEmbeddedContent"],

Cell[BoxData[
 FractionBox[
  RowBox[{"b", " ", 
   RowBox[{"(", 
    RowBox[{"1", "-", 
     SuperscriptBox["\[ExponentialE]", 
      RowBox[{
       RowBox[{"-", "a"}], " ", "t"}]]}], ")"}]}], "a"]], "Output", \
"PluginEmbeddedContent"]
}, Open  ]],

Cell["\<\
Experiment with the step response in the interactive plot.
What happens when a = 0?\
\>", "Text", "PluginEmbeddedContent",
 FontSize->16],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Manipulate", "[", "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Plot", "[", "\[IndentingNewLine]", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"b", "/", "a"}], ",", 
       RowBox[{"b", 
        RowBox[{
         RowBox[{"(", 
          RowBox[{"1", "-", 
           RowBox[{"Exp", "[", 
            RowBox[{
             RowBox[{"-", "a"}], " ", "t"}], "]"}]}], ")"}], "/", "a"}]}]}], 
      "}"}], "\[IndentingNewLine]", ",", "\[IndentingNewLine]", 
     RowBox[{"{", 
      RowBox[{"t", ",", "0", ",", "10"}], "}"}], ",", "\[IndentingNewLine]", 
     RowBox[{"PlotStyle", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{"Dashed", ",", "Blue"}], "}"}]}], ",", "\[IndentingNewLine]", 
     RowBox[{"PlotRange", "\[Rule]", "All"}], ",", "\[IndentingNewLine]", 
     RowBox[{"GridLines", "\[Rule]", "Automatic"}], ",", 
     "\[IndentingNewLine]", 
     RowBox[{"Frame", "\[Rule]", "True"}], ",", "\[IndentingNewLine]", 
     RowBox[{"FrameLabel", "\[Rule]", 
      RowBox[{"{", "\[IndentingNewLine]", 
       RowBox[{
        RowBox[{"{", 
         RowBox[{"\"\<y\>\"", ",", "\"\<\>\""}], "}"}], ",", 
        "\[IndentingNewLine]", 
        RowBox[{"{", 
         RowBox[{"\"\<t\>\"", ",", 
          RowBox[{"\"\<(a,b)=(\>\"", "<>", 
           RowBox[{"ToString", "[", "a", "]"}], "<>", "\"\<,\>\"", "<>", 
           RowBox[{"ToString", "[", "b", "]"}], "<>", "\"\<)\>\""}]}], 
         "}"}]}], "\[IndentingNewLine]", "}"}]}]}], "\[IndentingNewLine]", 
    "]"}], "\[IndentingNewLine]", ",", "\[IndentingNewLine]", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"a", ",", "1", ",", "\"\<a\>\""}], "}"}], ",", "0.01", ",", 
     "2"}], "}"}], ",", "\[IndentingNewLine]", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"b", ",", "1", ",", "\"\<b\>\""}], "}"}], ",", 
     RowBox[{"-", "2"}], ",", "2"}], "}"}]}], "\[IndentingNewLine]", 
  "]"}]], "Input", "PluginEmbeddedContent",
 CellOpen->False],

Cell[BoxData[
 TagBox[
  StyleBox[
   DynamicModuleBox[{$CellContext`a$$ = 1, $CellContext`b$$ = 1, 
    Typeset`show$$ = True, Typeset`bookmarkList$$ = {}, 
    Typeset`bookmarkMode$$ = "Menu", Typeset`animator$$, Typeset`animvar$$ = 
    1, Typeset`name$$ = "\"untitled\"", Typeset`specs$$ = {{{
       Hold[$CellContext`a$$], 1, "a"}, 0.01, 2}, {{
       Hold[$CellContext`b$$], 1, "b"}, -2, 2}}, Typeset`size$$ = {
    360., {117., 122.}}, Typeset`update$$ = 0, Typeset`initDone$$, 
    Typeset`skipInitDone$$ = True, $CellContext`a$168$$ = 
    0, $CellContext`b$169$$ = 0}, 
    DynamicBox[Manipulate`ManipulateBoxes[
     1, StandardForm, 
      "Variables" :> {$CellContext`a$$ = 1, $CellContext`b$$ = 1}, 
      "ControllerVariables" :> {
        Hold[$CellContext`a$$, $CellContext`a$168$$, 0], 
        Hold[$CellContext`b$$, $CellContext`b$169$$, 0]}, 
      "OtherVariables" :> {
       Typeset`show$$, Typeset`bookmarkList$$, Typeset`bookmarkMode$$, 
        Typeset`animator$$, Typeset`animvar$$, Typeset`name$$, 
        Typeset`specs$$, Typeset`size$$, Typeset`update$$, Typeset`initDone$$,
         Typeset`skipInitDone$$}, "Body" :> 
      Plot[{$CellContext`b$$/$CellContext`a$$, $CellContext`b$$ ((1 - 
           Exp[(-$CellContext`a$$) $CellContext`t])/$CellContext`a$$)}, \
{$CellContext`t, 0, 10}, PlotStyle -> {Dashed, Blue}, PlotRange -> All, 
        GridLines -> Automatic, Frame -> True, FrameLabel -> {{"y", ""}, {"t", 
           StringJoin["(a,b)=(", 
            ToString[$CellContext`a$$], ",", 
            ToString[$CellContext`b$$], ")"]}}], 
      "Specifications" :> {{{$CellContext`a$$, 1, "a"}, 0.01, 
         2}, {{$CellContext`b$$, 1, "b"}, -2, 2}}, "Options" :> {}, 
      "DefaultOptions" :> {}],
     ImageSizeCache->{403., {173., 179.}},
     SingleEvaluation->True],
    Deinitialization:>None,
    DynamicModuleValues:>{},
    SynchronousInitialization->True,
    UnsavedVariables:>{Typeset`initDone$$},
    UntrackedVariables:>{Typeset`size$$}], "Manipulate",
   Deployed->True,
   StripOnInput->False],
  Manipulate`InterpretManipulate[1]]], "Output", "PluginEmbeddedContent"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["Step Response (a = 0)", "Subsection", "PluginEmbeddedContent"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"G", "=", 
  RowBox[{"b", "/", "s"}]}]], "Input", "PluginEmbeddedContent"],

Cell[BoxData[
 FractionBox["b", "s"]], "Output", "PluginEmbeddedContent"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Collect", "[", 
  RowBox[{
   RowBox[{"InverseLaplaceTransform", "[", 
    RowBox[{
     RowBox[{"G", "/", "s"}], ",", "s", ",", "t"}], "]"}], ",", 
   RowBox[{"{", 
    RowBox[{"a", ",", "b"}], "}"}]}], "]"}]], "Input", \
"PluginEmbeddedContent"],

Cell[BoxData[
 RowBox[{"b", " ", "t"}]], "Output", "PluginEmbeddedContent"]
}, Open  ]]
}, Open  ]]
}, Open  ]]
}, Open  ]]
},
WindowSize->{431.42, 1650.2399999999998`},
ScrollingOptions->{"HorizontalScrollRange"->Fit,
"VerticalScrollRange"->Fit},
ShowCellBracket->False,
ShowSelection->True,
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
Cell[1257, 32, 57, 0, 36, "Title"],
Cell[1317, 34, 57, 0, 16, "Subsubtitle"],
Cell[1377, 36, 68, 0, 16, "Subsubtitle"],
Cell[CellGroupData[{
Cell[1470, 40, 62, 0, 25, "Section"],
Cell[CellGroupData[{
Cell[1557, 44, 63, 0, 14, "Subsection"],
Cell[CellGroupData[{
Cell[1645, 48, 146, 4, 12, "Input"],
Cell[1794, 54, 96, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[1927, 61, 134, 2, 12, "Input"],
Cell[2064, 65, 157, 4, 15, "Output"]
}, Open  ]],
Cell[2236, 72, 175, 4, 35, "Text"],
Cell[CellGroupData[{
Cell[2436, 80, 1704, 42, 19, "Input",
 CellOpen->False],
Cell[4143, 124, 2008, 41, 354, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[6200, 171, 60, 0, 14, "Subsection"],
Cell[CellGroupData[{
Cell[6285, 175, 271, 8, 12, "Input"],
Cell[6559, 185, 238, 8, 36, "Output"]
}, Open  ]],
Cell[6812, 196, 147, 4, 35, "Text"],
Cell[CellGroupData[{
Cell[6984, 204, 1978, 49, 19, "Input",
 CellOpen->False],
Cell[8965, 255, 2129, 42, 354, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[11143, 303, 68, 0, 14, "Subsection"],
Cell[CellGroupData[{
Cell[11236, 307, 97, 2, 12, "Input"],
Cell[11336, 311, 73, 1, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[11446, 317, 271, 8, 12, "Input"],
Cell[11720, 327, 75, 1, 12, "Output"]
}, Open  ]]
}, Open  ]]
}, Open  ]]
}, Open  ]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature IwT2jj4t0AcxYA1VcI#Sk6MJ *)
