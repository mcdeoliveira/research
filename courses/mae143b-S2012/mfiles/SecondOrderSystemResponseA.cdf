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
NotebookDataLength[     40250,       1123]
NotebookOptionsPosition[     37785,       1013]
NotebookOutlinePosition[     38284,       1035]
CellTagsIndexPosition[     38241,       1032]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{

Cell[CellGroupData[{
Cell["System Response", "Title", "PluginEmbeddedContent"],

Cell["MAE 143 B", "Subsubtitle", "PluginEmbeddedContent"],

Cell["Mauricio de Oliveira", "Subsubtitle", "PluginEmbeddedContent"],

Cell[CellGroupData[{

Cell["Second-order System I", "Section", "PluginEmbeddedContent"],

Cell[CellGroupData[{

Cell["Impulse Response", "Subsection", "PluginEmbeddedContent"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"G", "=", 
  RowBox[{
   RowBox[{"b", "/", 
    RowBox[{"(", 
     RowBox[{"s", "+", "a"}], ")"}]}], "+", 
   RowBox[{"d", "/", 
    RowBox[{"(", 
     RowBox[{"s", "+", "c"}], ")"}]}]}]}]], "Input", "PluginEmbeddedContent"],

Cell[BoxData[
 RowBox[{
  FractionBox["b", 
   RowBox[{"a", "+", "s"}]], "+", 
  FractionBox["d", 
   RowBox[{"c", "+", "s"}]]}]], "Output", "PluginEmbeddedContent"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"InverseLaplaceTransform", "[", 
  RowBox[{"G", ",", "s", ",", "t"}], "]"}]], "Input", "PluginEmbeddedContent"],

Cell[BoxData[
 RowBox[{
  RowBox[{"b", " ", 
   SuperscriptBox["\[ExponentialE]", 
    RowBox[{
     RowBox[{"-", "a"}], " ", "t"}]]}], "+", 
  RowBox[{"d", " ", 
   SuperscriptBox["\[ExponentialE]", 
    RowBox[{
     RowBox[{"-", "c"}], " ", "t"}]]}]}]], "Output", "PluginEmbeddedContent"]
}, Open  ]],

Cell["\<\
Experiment with the impulse response in the interactive plot.
Try a = 0 or c = 0 as well as negatives values of b and d.
Try a ~ 0.3, b ~ 1, c ~ 1 and d ~ -1.3\
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
       RowBox[{"b", "  ", 
        RowBox[{"Exp", "[", 
         RowBox[{
          RowBox[{"-", "a"}], " ", "t"}], "]"}]}], "+", 
       RowBox[{"d", " ", 
        RowBox[{"Exp", "[", 
         RowBox[{
          RowBox[{"-", "c"}], " ", "t"}], "]"}]}]}], "}"}], 
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
          RowBox[{"\"\<(a,b)=(\>\"", "<>", 
           RowBox[{"ToString", "[", "a", "]"}], "<>", "\"\<,\>\"", "<>", 
           RowBox[{"ToString", "[", "b", "]"}], "<>", "\"\<)\>\"", "<>", 
           "\"\<\\t(c,d)=(\>\"", "<>", 
           RowBox[{"ToString", "[", "c", "]"}], "<>", "\"\<,\>\"", "<>", 
           RowBox[{"ToString", "[", "d", "]"}], "<>", "\"\<)\>\""}]}], 
         "}"}]}], "\[IndentingNewLine]", "}"}]}]}], "\[IndentingNewLine]", 
    "]"}], "\[IndentingNewLine]", ",", "\[IndentingNewLine]", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"a", ",", "1", ",", "\"\<a\>\""}], "}"}], ",", 
     RowBox[{"-", "2"}], ",", "2"}], "}"}], ",", "\[IndentingNewLine]", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"b", ",", "1", ",", "\"\<b\>\""}], "}"}], ",", 
     RowBox[{"-", "2"}], ",", "2"}], "}"}], ",", "\[IndentingNewLine]", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"c", ",", "1", ",", "\"\<c\>\""}], "}"}], ",", 
     RowBox[{"-", "2"}], ",", "2"}], "}"}], ",", "\[IndentingNewLine]", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"d", ",", "1", ",", "\"\<d\>\""}], "}"}], ",", 
     RowBox[{"-", "2"}], ",", "2"}], "}"}]}], "\[IndentingNewLine]", 
  "]"}]], "Input", "PluginEmbeddedContent",
 CellOpen->False],

Cell[BoxData[
 TagBox[
  StyleBox[
   DynamicModuleBox[{$CellContext`a$$ = 1, $CellContext`b$$ = 
    1, $CellContext`c$$ = 1, $CellContext`d$$ = 1, Typeset`show$$ = True, 
    Typeset`bookmarkList$$ = {}, Typeset`bookmarkMode$$ = "Menu", 
    Typeset`animator$$, Typeset`animvar$$ = 1, Typeset`name$$ = 
    "\"untitled\"", Typeset`specs$$ = {{{
       Hold[$CellContext`a$$], 1, "a"}, -2, 2}, {{
       Hold[$CellContext`b$$], 1, "b"}, -2, 2}, {{
       Hold[$CellContext`c$$], 1, "c"}, -2, 2}, {{
       Hold[$CellContext`d$$], 1, "d"}, -2, 2}}, Typeset`size$$ = {
    360., {117., 122.}}, Typeset`update$$ = 0, Typeset`initDone$$, 
    Typeset`skipInitDone$$ = True, $CellContext`a$4831$$ = 
    0, $CellContext`b$4832$$ = 0, $CellContext`c$4833$$ = 
    0, $CellContext`d$4834$$ = 0}, 
    DynamicBox[Manipulate`ManipulateBoxes[
     1, StandardForm, 
      "Variables" :> {$CellContext`a$$ = 1, $CellContext`b$$ = 
        1, $CellContext`c$$ = 1, $CellContext`d$$ = 1}, "ControllerVariables" :> {
        Hold[$CellContext`a$$, $CellContext`a$4831$$, 0], 
        Hold[$CellContext`b$$, $CellContext`b$4832$$, 0], 
        Hold[$CellContext`c$$, $CellContext`c$4833$$, 0], 
        Hold[$CellContext`d$$, $CellContext`d$4834$$, 0]}, 
      "OtherVariables" :> {
       Typeset`show$$, Typeset`bookmarkList$$, Typeset`bookmarkMode$$, 
        Typeset`animator$$, Typeset`animvar$$, Typeset`name$$, 
        Typeset`specs$$, Typeset`size$$, Typeset`update$$, Typeset`initDone$$,
         Typeset`skipInitDone$$}, "Body" :> 
      Plot[{$CellContext`b$$ 
          Exp[(-$CellContext`a$$) $CellContext`t] + $CellContext`d$$ 
          Exp[(-$CellContext`c$$) $CellContext`t]}, {$CellContext`t, 0, 10}, 
        PlotStyle -> {Blue}, PlotRange -> All, GridLines -> Automatic, Frame -> 
        True, FrameLabel -> {{"y", ""}, {"t", 
           StringJoin["(a,b)=(", 
            ToString[$CellContext`a$$], ",", 
            ToString[$CellContext`b$$], ")", "\t(c,d)=(", 
            ToString[$CellContext`c$$], ",", 
            ToString[$CellContext`d$$], ")"]}}], 
      "Specifications" :> {{{$CellContext`a$$, 1, "a"}, -2, 
         2}, {{$CellContext`b$$, 1, "b"}, -2, 
         2}, {{$CellContext`c$$, 1, "c"}, -2, 
         2}, {{$CellContext`d$$, 1, "d"}, -2, 2}}, "Options" :> {}, 
      "DefaultOptions" :> {}],
     ImageSizeCache->{403., {201., 207.}},
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
 RowBox[{
  FractionBox["d", "c"], "-", 
  FractionBox[
   RowBox[{"d", " ", 
    SuperscriptBox["\[ExponentialE]", 
     RowBox[{
      RowBox[{"-", "c"}], " ", "t"}]]}], "c"], "+", 
  FractionBox[
   RowBox[{"b", " ", 
    RowBox[{"(", 
     RowBox[{"1", "-", 
      SuperscriptBox["\[ExponentialE]", 
       RowBox[{
        RowBox[{"-", "a"}], " ", "t"}]]}], ")"}]}], "a"]}]], "Output", \
"PluginEmbeddedContent"]
}, Open  ]],

Cell["\<\
Experiment with the step response in the interactive plot.
Try a = b = 1 and c ~ 1.4, d ~ -1.3\
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
       RowBox[{"(", 
        RowBox[{
         RowBox[{"d", "/", "c"}], "+", 
         RowBox[{"b", "/", "a"}]}], ")"}], ",", 
       RowBox[{
        RowBox[{"(", 
         RowBox[{
          RowBox[{"d", "/", "c"}], "+", 
          RowBox[{"b", "/", "a"}]}], ")"}], "-", 
        RowBox[{
         RowBox[{"(", 
          RowBox[{"b", "/", "a"}], ")"}], 
         RowBox[{"Exp", "[", 
          RowBox[{
           RowBox[{"-", "a"}], " ", "t"}], "]"}]}], "-", 
        RowBox[{
         RowBox[{"(", 
          RowBox[{"d", "/", "c"}], ")"}], 
         RowBox[{"Exp", "[", 
          RowBox[{
           RowBox[{"-", "c"}], " ", "t"}], "]"}]}]}]}], "}"}], 
     "\[IndentingNewLine]", ",", "\[IndentingNewLine]", 
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
           RowBox[{"ToString", "[", "b", "]"}], "<>", "\"\<)\>\"", "<>", 
           "\"\<\\t(c,d)=(\>\"", "<>", 
           RowBox[{"ToString", "[", "c", "]"}], "<>", "\"\<,\>\"", "<>", 
           RowBox[{"ToString", "[", "d", "]"}], "<>", "\"\<)\>\""}]}], 
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
     RowBox[{"-", "2"}], ",", "2"}], "}"}], ",", "\[IndentingNewLine]", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"c", ",", "1", ",", "\"\<c\>\""}], "}"}], ",", "0.01", ",", 
     "2"}], "}"}], ",", "\[IndentingNewLine]", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"d", ",", "1", ",", "\"\<d\>\""}], "}"}], ",", 
     RowBox[{"-", "2"}], ",", "2"}], "}"}]}], "\[IndentingNewLine]", 
  "]"}]], "Input", "PluginEmbeddedContent",
 CellOpen->False],

Cell[BoxData[
 TagBox[
  StyleBox[
   DynamicModuleBox[{$CellContext`a$$ = 1, $CellContext`b$$ = 
    1, $CellContext`c$$ = 1, $CellContext`d$$ = 1, Typeset`show$$ = True, 
    Typeset`bookmarkList$$ = {}, Typeset`bookmarkMode$$ = "Menu", 
    Typeset`animator$$, Typeset`animvar$$ = 1, Typeset`name$$ = 
    "\"untitled\"", Typeset`specs$$ = {{{
       Hold[$CellContext`a$$], 1, "a"}, 0.01, 2}, {{
       Hold[$CellContext`b$$], 1, "b"}, -2, 2}, {{
       Hold[$CellContext`c$$], 1, "c"}, 0.01, 2}, {{
       Hold[$CellContext`d$$], 1, "d"}, -2, 2}}, Typeset`size$$ = {
    360., {117., 122.}}, Typeset`update$$ = 0, Typeset`initDone$$, 
    Typeset`skipInitDone$$ = True, $CellContext`a$4883$$ = 
    0, $CellContext`b$4884$$ = 0, $CellContext`c$4885$$ = 
    0, $CellContext`d$4886$$ = 0}, 
    DynamicBox[Manipulate`ManipulateBoxes[
     1, StandardForm, 
      "Variables" :> {$CellContext`a$$ = 1, $CellContext`b$$ = 
        1, $CellContext`c$$ = 1, $CellContext`d$$ = 1}, "ControllerVariables" :> {
        Hold[$CellContext`a$$, $CellContext`a$4883$$, 0], 
        Hold[$CellContext`b$$, $CellContext`b$4884$$, 0], 
        Hold[$CellContext`c$$, $CellContext`c$4885$$, 0], 
        Hold[$CellContext`d$$, $CellContext`d$4886$$, 0]}, 
      "OtherVariables" :> {
       Typeset`show$$, Typeset`bookmarkList$$, Typeset`bookmarkMode$$, 
        Typeset`animator$$, Typeset`animvar$$, Typeset`name$$, 
        Typeset`specs$$, Typeset`size$$, Typeset`update$$, Typeset`initDone$$,
         Typeset`skipInitDone$$}, "Body" :> 
      Plot[{$CellContext`d$$/$CellContext`c$$ + \
$CellContext`b$$/$CellContext`a$$, ($CellContext`d$$/$CellContext`c$$ + \
$CellContext`b$$/$CellContext`a$$) - ($CellContext`b$$/$CellContext`a$$) 
         Exp[(-$CellContext`a$$) $CellContext`t] - \
($CellContext`d$$/$CellContext`c$$) 
         Exp[(-$CellContext`c$$) $CellContext`t]}, {$CellContext`t, 0, 10}, 
        PlotStyle -> {Dashed, Blue}, PlotRange -> All, GridLines -> Automatic,
         Frame -> True, FrameLabel -> {{"y", ""}, {"t", 
           StringJoin["(a,b)=(", 
            ToString[$CellContext`a$$], ",", 
            ToString[$CellContext`b$$], ")", "\t(c,d)=(", 
            ToString[$CellContext`c$$], ",", 
            ToString[$CellContext`d$$], ")"]}}], 
      "Specifications" :> {{{$CellContext`a$$, 1, "a"}, 0.01, 
         2}, {{$CellContext`b$$, 1, "b"}, -2, 2}, {{$CellContext`c$$, 1, "c"},
          0.01, 2}, {{$CellContext`d$$, 1, "d"}, -2, 2}}, "Options" :> {}, 
      "DefaultOptions" :> {}],
     ImageSizeCache->{403., {201., 207.}},
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
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["Second-order System II", "Section", "PluginEmbeddedContent"],

Cell[CellGroupData[{

Cell["Impulse Response", "Subsection", "PluginEmbeddedContent"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"G", "=", 
  RowBox[{"d", "/", 
   RowBox[{"(", 
    RowBox[{
     RowBox[{"(", 
      RowBox[{"s", "+", "a"}], ")"}], 
     RowBox[{"(", 
      RowBox[{"s", "+", "c"}], ")"}]}], ")"}]}]}]], "Input", \
"PluginEmbeddedContent"],

Cell[BoxData[
 FractionBox["d", 
  RowBox[{
   RowBox[{"(", 
    RowBox[{"a", "+", "s"}], ")"}], " ", 
   RowBox[{"(", 
    RowBox[{"c", "+", "s"}], ")"}]}]]], "Output", "PluginEmbeddedContent"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"InverseLaplaceTransform", "[", 
  RowBox[{"G", ",", "s", ",", "t"}], "]"}]], "Input", "PluginEmbeddedContent"],

Cell[BoxData[
 RowBox[{"d", " ", 
  RowBox[{"(", 
   RowBox[{
    FractionBox[
     SuperscriptBox["\[ExponentialE]", 
      RowBox[{
       RowBox[{"-", "a"}], " ", "t"}]], 
     RowBox[{
      RowBox[{"-", "a"}], "+", "c"}]], "+", 
    FractionBox[
     SuperscriptBox["\[ExponentialE]", 
      RowBox[{
       RowBox[{"-", "c"}], " ", "t"}]], 
     RowBox[{"a", "-", "c"}]]}], ")"}]}]], "Output", "PluginEmbeddedContent"]
}, Open  ]],

Cell["\<\
Experiment with the impulse response in the interactive plot.
What happens when a = c?\
\>", "Text", "PluginEmbeddedContent",
 FontSize->16],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Manipulate", "[", "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Plot", "[", "\[IndentingNewLine]", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"d", 
       RowBox[{
        RowBox[{"(", "  ", 
         RowBox[{
          RowBox[{"Exp", "[", 
           RowBox[{
            RowBox[{"-", "a"}], " ", "t"}], "]"}], "-", " ", 
          RowBox[{"Exp", "[", 
           RowBox[{
            RowBox[{"-", "c"}], " ", "t"}], "]"}]}], ")"}], "/", 
        RowBox[{"(", 
         RowBox[{"c", "-", "a"}], ")"}]}]}], "}"}], "\[IndentingNewLine]", 
     ",", "\[IndentingNewLine]", 
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
         RowBox[{"\"\<y(t)\>\"", ",", "\"\<\>\""}], "}"}], ",", 
        "\[IndentingNewLine]", 
        RowBox[{"{", 
         RowBox[{"\"\<t\>\"", ",", 
          RowBox[{"\"\<a = \>\"", "<>", 
           RowBox[{"ToString", "[", "a", "]"}], "<>", "\"\<, c = \>\"", "<>", 
           
           RowBox[{"ToString", "[", "c", "]"}], "<>", "\"\<, d = \>\"", "<>", 
           
           RowBox[{"ToString", "[", "d", "]"}]}]}], "}"}]}], 
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
      RowBox[{"c", ",", ".5", ",", "\"\<c\>\""}], "}"}], ",", 
     RowBox[{"-", "2"}], ",", "2"}], "}"}], ",", "\[IndentingNewLine]", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"d", ",", "1", ",", "\"\<d\>\""}], "}"}], ",", 
     RowBox[{"-", "2"}], ",", "2"}], "}"}]}], "\[IndentingNewLine]", 
  "]"}]], "Input", "PluginEmbeddedContent",
 CellOpen->False],

Cell[BoxData[
 TagBox[
  StyleBox[
   DynamicModuleBox[{$CellContext`a$$ = 1, $CellContext`c$$ = 
    0.5, $CellContext`d$$ = 1, Typeset`show$$ = True, 
    Typeset`bookmarkList$$ = {}, Typeset`bookmarkMode$$ = "Menu", 
    Typeset`animator$$, Typeset`animvar$$ = 1, Typeset`name$$ = 
    "\"untitled\"", Typeset`specs$$ = {{{
       Hold[$CellContext`a$$], 1, "a"}, -2, 2}, {{
       Hold[$CellContext`c$$], 0.5, "c"}, -2, 2}, {{
       Hold[$CellContext`d$$], 1, "d"}, -2, 2}}, Typeset`size$$ = {
    360., {117., 122.}}, Typeset`update$$ = 0, Typeset`initDone$$, 
    Typeset`skipInitDone$$ = True, $CellContext`a$4933$$ = 
    0, $CellContext`c$4934$$ = 0, $CellContext`d$4935$$ = 0}, 
    DynamicBox[Manipulate`ManipulateBoxes[
     1, StandardForm, 
      "Variables" :> {$CellContext`a$$ = 1, $CellContext`c$$ = 
        0.5, $CellContext`d$$ = 1}, "ControllerVariables" :> {
        Hold[$CellContext`a$$, $CellContext`a$4933$$, 0], 
        Hold[$CellContext`c$$, $CellContext`c$4934$$, 0], 
        Hold[$CellContext`d$$, $CellContext`d$4935$$, 0]}, 
      "OtherVariables" :> {
       Typeset`show$$, Typeset`bookmarkList$$, Typeset`bookmarkMode$$, 
        Typeset`animator$$, Typeset`animvar$$, Typeset`name$$, 
        Typeset`specs$$, Typeset`size$$, Typeset`update$$, Typeset`initDone$$,
         Typeset`skipInitDone$$}, "Body" :> 
      Plot[{$CellContext`d$$ ((Exp[(-$CellContext`a$$) $CellContext`t] - 
           Exp[(-$CellContext`c$$) $CellContext`t])/($CellContext`c$$ - \
$CellContext`a$$))}, {$CellContext`t, 0, 10}, PlotStyle -> {Blue}, PlotRange -> 
        All, GridLines -> Automatic, Frame -> True, 
        FrameLabel -> {{"y(t)", ""}, {"t", 
           StringJoin["a = ", 
            ToString[$CellContext`a$$], ", c = ", 
            ToString[$CellContext`c$$], ", d = ", 
            ToString[$CellContext`d$$]]}}], 
      "Specifications" :> {{{$CellContext`a$$, 1, "a"}, -2, 
         2}, {{$CellContext`c$$, 0.5, "c"}, -2, 
         2}, {{$CellContext`d$$, 1, "d"}, -2, 2}}, "Options" :> {}, 
      "DefaultOptions" :> {}],
     ImageSizeCache->{403., {187., 193.}},
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
 RowBox[{"InverseLaplaceTransform", "[", 
  RowBox[{
   RowBox[{"G", "/", "s"}], ",", "s", ",", "t"}], "]"}]], "Input", \
"PluginEmbeddedContent"],

Cell[BoxData[
 RowBox[{"d", " ", 
  RowBox[{"(", 
   RowBox[{
    FractionBox["1", 
     RowBox[{"a", " ", "c"}]], "+", 
    FractionBox[
     SuperscriptBox["\[ExponentialE]", 
      RowBox[{
       RowBox[{"-", "a"}], " ", "t"}]], 
     RowBox[{"a", " ", 
      RowBox[{"(", 
       RowBox[{"a", "-", "c"}], ")"}]}]], "-", 
    FractionBox[
     SuperscriptBox["\[ExponentialE]", 
      RowBox[{
       RowBox[{"-", "c"}], " ", "t"}]], 
     RowBox[{
      RowBox[{"(", 
       RowBox[{"a", "-", "c"}], ")"}], " ", "c"}]]}], ")"}]}]], "Output", \
"PluginEmbeddedContent"]
}, Open  ]],

Cell["Experiment with the step response in the interactive plot.", "Text", "PluginEmbeddedContent",
 FontSize->16],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Manipulate", "[", "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Plot", "[", "\[IndentingNewLine]", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"d", "/", 
        RowBox[{"(", 
         RowBox[{"a", " ", "c"}], ")"}]}], ",", 
       RowBox[{"d", 
        RowBox[{"(", 
         RowBox[{
          RowBox[{"1", "/", 
           RowBox[{"(", 
            RowBox[{"a", " ", "c"}], ")"}]}], "+", 
          RowBox[{
           RowBox[{"(", " ", 
            RowBox[{
             RowBox[{
              RowBox[{"Exp", "[", 
               RowBox[{
                RowBox[{"-", "a"}], " ", "t"}], "]"}], "/", "a"}], "-", " ", 
             RowBox[{
              RowBox[{"Exp", "[", 
               RowBox[{
                RowBox[{"-", "c"}], " ", "t"}], "]"}], "/", "c"}]}], ")"}], 
           "/", 
           RowBox[{"(", 
            RowBox[{"a", "-", "c"}], ")"}]}]}], ")"}]}]}], "}"}], 
     "\[IndentingNewLine]", ",", "\[IndentingNewLine]", 
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
          RowBox[{"\"\<a = \>\"", "<>", 
           RowBox[{"ToString", "[", "a", "]"}], "<>", "\"\<, c = \>\"", "<>", 
           
           RowBox[{"ToString", "[", "c", "]"}], "<>", "\"\<, d = \>\"", "<>", 
           
           RowBox[{"ToString", "[", "d", "]"}]}]}], "}"}]}], 
       "\[IndentingNewLine]", "}"}]}]}], "\[IndentingNewLine]", "]"}], 
   "\[IndentingNewLine]", ",", "\[IndentingNewLine]", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"a", ",", "1", ",", "\"\<a\>\""}], "}"}], ",", "0.01", ",", 
     "2"}], "}"}], ",", "\[IndentingNewLine]", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"c", ",", ".5", ",", "\"\<c\>\""}], "}"}], ",", "0.01", ",", 
     "2"}], "}"}], ",", "\[IndentingNewLine]", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"d", ",", "1", ",", "\"\<d\>\""}], "}"}], ",", 
     RowBox[{"-", "2"}], ",", "2"}], "}"}]}], "\[IndentingNewLine]", 
  "]"}]], "Input", "PluginEmbeddedContent",
 CellOpen->False],

Cell[BoxData[
 TagBox[
  StyleBox[
   DynamicModuleBox[{$CellContext`a$$ = 1, $CellContext`c$$ = 
    0.5, $CellContext`d$$ = 1, Typeset`show$$ = True, 
    Typeset`bookmarkList$$ = {}, Typeset`bookmarkMode$$ = "Menu", 
    Typeset`animator$$, Typeset`animvar$$ = 1, Typeset`name$$ = 
    "\"untitled\"", Typeset`specs$$ = {{{
       Hold[$CellContext`a$$], 1, "a"}, 0.01, 2}, {{
       Hold[$CellContext`c$$], 0.5, "c"}, 0.01, 2}, {{
       Hold[$CellContext`d$$], 1, "d"}, -2, 2}}, Typeset`size$$ = {
    360., {117., 122.}}, Typeset`update$$ = 0, Typeset`initDone$$, 
    Typeset`skipInitDone$$ = True, $CellContext`a$4980$$ = 
    0, $CellContext`c$4981$$ = 0, $CellContext`d$4982$$ = 0}, 
    DynamicBox[Manipulate`ManipulateBoxes[
     1, StandardForm, 
      "Variables" :> {$CellContext`a$$ = 1, $CellContext`c$$ = 
        0.5, $CellContext`d$$ = 1}, "ControllerVariables" :> {
        Hold[$CellContext`a$$, $CellContext`a$4980$$, 0], 
        Hold[$CellContext`c$$, $CellContext`c$4981$$, 0], 
        Hold[$CellContext`d$$, $CellContext`d$4982$$, 0]}, 
      "OtherVariables" :> {
       Typeset`show$$, Typeset`bookmarkList$$, Typeset`bookmarkMode$$, 
        Typeset`animator$$, Typeset`animvar$$, Typeset`name$$, 
        Typeset`specs$$, Typeset`size$$, Typeset`update$$, Typeset`initDone$$,
         Typeset`skipInitDone$$}, "Body" :> 
      Plot[{$CellContext`d$$/($CellContext`a$$ $CellContext`c$$), \
$CellContext`d$$ (
          1/($CellContext`a$$ $CellContext`c$$) + (
            Exp[(-$CellContext`a$$) $CellContext`t]/$CellContext`a$$ - 
            Exp[(-$CellContext`c$$) \
$CellContext`t]/$CellContext`c$$)/($CellContext`a$$ - $CellContext`c$$))}, \
{$CellContext`t, 0, 10}, PlotStyle -> {Dashed, Blue}, PlotRange -> All, 
        GridLines -> Automatic, Frame -> True, FrameLabel -> {{"y", ""}, {"t", 
           StringJoin["a = ", 
            ToString[$CellContext`a$$], ", c = ", 
            ToString[$CellContext`c$$], ", d = ", 
            ToString[$CellContext`d$$]]}}], 
      "Specifications" :> {{{$CellContext`a$$, 1, "a"}, 0.01, 
         2}, {{$CellContext`c$$, 0.5, "c"}, 0.01, 
         2}, {{$CellContext`d$$, 1, "d"}, -2, 2}}, "Options" :> {}, 
      "DefaultOptions" :> {}],
     ImageSizeCache->{403., {187., 193.}},
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

Cell["Impulse Response (c = a)", "Subsection", "PluginEmbeddedContent"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"G", "=", 
  RowBox[{
   RowBox[{"d", "/", 
    RowBox[{"(", 
     RowBox[{
      RowBox[{"(", 
       RowBox[{"s", "+", "a"}], ")"}], 
      RowBox[{"(", 
       RowBox[{"s", "+", "c"}], ")"}]}], ")"}]}], "/.", 
   RowBox[{"c", "\[Rule]", "a"}]}]}]], "Input", "PluginEmbeddedContent"],

Cell[BoxData[
 FractionBox["d", 
  SuperscriptBox[
   RowBox[{"(", 
    RowBox[{"a", "+", "s"}], ")"}], "2"]]], "Output", "PluginEmbeddedContent"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"InverseLaplaceTransform", "[", 
  RowBox[{"G", ",", "s", ",", "t"}], "]"}]], "Input", "PluginEmbeddedContent"],

Cell[BoxData[
 RowBox[{"d", " ", 
  SuperscriptBox["\[ExponentialE]", 
   RowBox[{
    RowBox[{"-", "a"}], " ", "t"}]], " ", "t"}]], "Output", \
"PluginEmbeddedContent"]
}, Open  ]],

Cell["\<\
Experiment with the impulse response in the interactive plot.\
\>", "Text", "PluginEmbeddedContent",
 FontSize->16],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Manipulate", "[", "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Plot", "[", "\[IndentingNewLine]", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"d", " ", "t", "  ", 
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
         RowBox[{"\"\<y(t)\>\"", ",", "\"\<\>\""}], "}"}], ",", 
        "\[IndentingNewLine]", 
        RowBox[{"{", 
         RowBox[{"\"\<t\>\"", ",", 
          RowBox[{"\"\<a = \>\"", "<>", 
           RowBox[{"ToString", "[", "a", "]"}], "<>", "\"\<, d = \>\"", "<>", 
           
           RowBox[{"ToString", "[", "d", "]"}]}]}], "}"}]}], 
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
      RowBox[{"d", ",", "1", ",", "\"\<d\>\""}], "}"}], ",", 
     RowBox[{"-", "2"}], ",", "2"}], "}"}]}], "\[IndentingNewLine]", 
  "]"}]], "Input", "PluginEmbeddedContent",
 CellOpen->False],

Cell[BoxData[
 TagBox[
  StyleBox[
   DynamicModuleBox[{$CellContext`a$$ = 1, $CellContext`d$$ = 1, 
    Typeset`show$$ = True, Typeset`bookmarkList$$ = {}, 
    Typeset`bookmarkMode$$ = "Menu", Typeset`animator$$, Typeset`animvar$$ = 
    1, Typeset`name$$ = "\"untitled\"", Typeset`specs$$ = {{{
       Hold[$CellContext`a$$], 1, "a"}, -2, 2}, {{
       Hold[$CellContext`d$$], 1, "d"}, -2, 2}}, Typeset`size$$ = {
    360., {116., 120.}}, Typeset`update$$ = 0, Typeset`initDone$$, 
    Typeset`skipInitDone$$ = True, $CellContext`a$5022$$ = 
    0, $CellContext`d$5023$$ = 0}, 
    DynamicBox[Manipulate`ManipulateBoxes[
     1, StandardForm, 
      "Variables" :> {$CellContext`a$$ = 1, $CellContext`d$$ = 1}, 
      "ControllerVariables" :> {
        Hold[$CellContext`a$$, $CellContext`a$5022$$, 0], 
        Hold[$CellContext`d$$, $CellContext`d$5023$$, 0]}, 
      "OtherVariables" :> {
       Typeset`show$$, Typeset`bookmarkList$$, Typeset`bookmarkMode$$, 
        Typeset`animator$$, Typeset`animvar$$, Typeset`name$$, 
        Typeset`specs$$, Typeset`size$$, Typeset`update$$, Typeset`initDone$$,
         Typeset`skipInitDone$$}, "Body" :> 
      Plot[{$CellContext`d$$ $CellContext`t 
         Exp[(-$CellContext`a$$) $CellContext`t]}, {$CellContext`t, 0, 10}, 
        PlotStyle -> {Blue}, PlotRange -> All, GridLines -> Automatic, Frame -> 
        True, FrameLabel -> {{"y(t)", ""}, {"t", 
           StringJoin["a = ", 
            ToString[$CellContext`a$$], ", d = ", 
            ToString[$CellContext`d$$]]}}], 
      "Specifications" :> {{{$CellContext`a$$, 1, "a"}, -2, 
         2}, {{$CellContext`d$$, 1, "d"}, -2, 2}}, "Options" :> {}, 
      "DefaultOptions" :> {}],
     ImageSizeCache->{403., {172., 178.}},
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

Cell["Step Response (c = a)", "Subsection", "PluginEmbeddedContent"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"InverseLaplaceTransform", "[", 
  RowBox[{
   RowBox[{"G", "/", "s"}], ",", "s", ",", "t"}], "]"}]], "Input", \
"PluginEmbeddedContent"],

Cell[BoxData[
 FractionBox[
  RowBox[{"d", " ", 
   SuperscriptBox["\[ExponentialE]", 
    RowBox[{
     RowBox[{"-", "a"}], " ", "t"}]], " ", 
   RowBox[{"(", 
    RowBox[{
     RowBox[{"-", "1"}], "+", 
     SuperscriptBox["\[ExponentialE]", 
      RowBox[{"a", " ", "t"}]], "-", 
     RowBox[{"a", " ", "t"}]}], ")"}]}], 
  SuperscriptBox["a", "2"]]], "Output", "PluginEmbeddedContent"]
}, Open  ]],

Cell["Experiment with the step response in the interactive plot.", "Text", "PluginEmbeddedContent",
 FontSize->16],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Manipulate", "[", "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Plot", "[", "\[IndentingNewLine]", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"d", "/", 
        RowBox[{"a", "^", "2"}]}], ",", 
       RowBox[{"d", 
        RowBox[{
         RowBox[{"(", 
          RowBox[{"1", "-", " ", 
           RowBox[{"Exp", "[", 
            RowBox[{
             RowBox[{"-", "a"}], " ", "t"}], "]"}], "-", 
           RowBox[{"a", " ", "t", " ", 
            RowBox[{"Exp", "[", 
             RowBox[{
              RowBox[{"-", "a"}], " ", "t"}], "]"}]}]}], ")"}], "/", 
         RowBox[{"a", "^", "2"}]}]}]}], "}"}], "\[IndentingNewLine]", ",", 
     "\[IndentingNewLine]", 
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
          RowBox[{"\"\<a = \>\"", "<>", 
           RowBox[{"ToString", "[", "a", "]"}], "<>", "\"\<, d = \>\"", "<>", 
           
           RowBox[{"ToString", "[", "d", "]"}]}]}], "}"}]}], "}"}]}]}], 
    "\[IndentingNewLine]", "]"}], "\[IndentingNewLine]", ",", 
   "\[IndentingNewLine]", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"a", ",", "1", ",", "\"\<a\>\""}], "}"}], ",", "0.01", ",", 
     "2"}], "}"}], ",", "\[IndentingNewLine]", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"d", ",", "1", ",", "\"\<d\>\""}], "}"}], ",", 
     RowBox[{"-", "2"}], ",", "2"}], "}"}]}], "\[IndentingNewLine]", 
  "]"}]], "Input", "PluginEmbeddedContent",
 CellOpen->False],

Cell[BoxData[
 TagBox[
  StyleBox[
   DynamicModuleBox[{$CellContext`a$$ = 1, $CellContext`d$$ = 1, 
    Typeset`show$$ = True, Typeset`bookmarkList$$ = {}, 
    Typeset`bookmarkMode$$ = "Menu", Typeset`animator$$, Typeset`animvar$$ = 
    1, Typeset`name$$ = "\"untitled\"", Typeset`specs$$ = {{{
       Hold[$CellContext`a$$], 1, "a"}, 0.01, 2}, {{
       Hold[$CellContext`d$$], 1, "d"}, -2, 2}}, Typeset`size$$ = {
    360., {117., 122.}}, Typeset`update$$ = 0, Typeset`initDone$$, 
    Typeset`skipInitDone$$ = True, $CellContext`a$5065$$ = 
    0, $CellContext`d$5066$$ = 0}, 
    DynamicBox[Manipulate`ManipulateBoxes[
     1, StandardForm, 
      "Variables" :> {$CellContext`a$$ = 1, $CellContext`d$$ = 1}, 
      "ControllerVariables" :> {
        Hold[$CellContext`a$$, $CellContext`a$5065$$, 0], 
        Hold[$CellContext`d$$, $CellContext`d$5066$$, 0]}, 
      "OtherVariables" :> {
       Typeset`show$$, Typeset`bookmarkList$$, Typeset`bookmarkMode$$, 
        Typeset`animator$$, Typeset`animvar$$, Typeset`name$$, 
        Typeset`specs$$, Typeset`size$$, Typeset`update$$, Typeset`initDone$$,
         Typeset`skipInitDone$$}, "Body" :> 
      Plot[{$CellContext`d$$/$CellContext`a$$^2, $CellContext`d$$ ((1 - 
           Exp[(-$CellContext`a$$) $CellContext`t] - $CellContext`a$$ \
$CellContext`t 
           Exp[(-$CellContext`a$$) $CellContext`t])/$CellContext`a$$^2)}, \
{$CellContext`t, 0, 10}, PlotStyle -> {Dashed, Blue}, PlotRange -> All, 
        GridLines -> Automatic, Frame -> True, FrameLabel -> {{"y", ""}, {"t", 
           StringJoin["a = ", 
            ToString[$CellContext`a$$], ", d = ", 
            ToString[$CellContext`d$$]]}}], 
      "Specifications" :> {{{$CellContext`a$$, 1, "a"}, 0.01, 
         2}, {{$CellContext`d$$, 1, "d"}, -2, 2}}, "Options" :> {}, 
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
}, Open  ]]
}, Open  ]]
}, Open  ]]
},
WindowSize->{630., 4819.7},
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
Cell[1470, 40, 65, 0, 25, "Section"],
Cell[CellGroupData[{
Cell[1560, 44, 63, 0, 14, "Subsection"],
Cell[CellGroupData[{
Cell[1648, 48, 247, 8, 12, "Input"],
Cell[1898, 58, 165, 5, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[2100, 68, 134, 2, 12, "Input"],
Cell[2237, 72, 291, 9, 15, "Output"]
}, Open  ]],
Cell[2543, 84, 223, 5, 54, "Text"],
Cell[CellGroupData[{
Cell[2791, 93, 2511, 61, 19, "Input",
 CellOpen->False],
Cell[5305, 156, 2710, 53, 410, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[8064, 215, 60, 0, 14, "Subsection"],
Cell[CellGroupData[{
Cell[8149, 219, 271, 8, 12, "Input"],
Cell[8423, 229, 431, 15, 36, "Output"]
}, Open  ]],
Cell[8869, 247, 158, 4, 35, "Text"],
Cell[CellGroupData[{
Cell[9052, 255, 2915, 75, 19, "Input",
 CellOpen->False],
Cell[11970, 332, 2903, 55, 410, "Output"]
}, Open  ]]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[14934, 394, 66, 0, 25, "Section"],
Cell[CellGroupData[{
Cell[15025, 398, 63, 0, 14, "Subsection"],
Cell[CellGroupData[{
Cell[15113, 402, 249, 9, 12, "Input"],
Cell[15365, 413, 194, 6, 33, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[15596, 424, 134, 2, 12, "Input"],
Cell[15733, 428, 424, 14, 37, "Output"]
}, Open  ]],
Cell[16172, 445, 150, 4, 35, "Text"],
Cell[CellGroupData[{
Cell[16347, 453, 2333, 59, 19, "Input",
 CellOpen->False],
Cell[18683, 514, 2448, 48, 382, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[21180, 568, 60, 0, 14, "Subsection"],
Cell[CellGroupData[{
Cell[21265, 572, 160, 4, 12, "Input"],
Cell[21428, 578, 573, 20, 37, "Output"]
}, Open  ]],
Cell[22016, 601, 114, 1, 16, "Text"],
Cell[CellGroupData[{
Cell[22155, 606, 2727, 72, 19, "Input",
 CellOpen->False],
Cell[24885, 680, 2609, 51, 382, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[27543, 737, 71, 0, 14, "Subsection"],
Cell[CellGroupData[{
Cell[27639, 741, 308, 10, 12, "Input"],
Cell[27950, 753, 146, 4, 35, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[28133, 762, 134, 2, 12, "Input"],
Cell[28270, 766, 169, 5, 15, "Output"]
}, Open  ]],
Cell[28454, 774, 125, 3, 16, "Text"],
Cell[CellGroupData[{
Cell[28604, 781, 1809, 44, 19, "Input",
 CellOpen->False],
Cell[30416, 827, 2081, 42, 352, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[32546, 875, 68, 0, 14, "Subsection"],
Cell[CellGroupData[{
Cell[32639, 879, 160, 4, 12, "Input"],
Cell[32802, 885, 389, 12, 37, "Output"]
}, Open  ]],
Cell[33206, 900, 114, 1, 16, "Text"],
Cell[CellGroupData[{
Cell[33345, 905, 2163, 56, 19, "Input",
 CellOpen->False],
Cell[35511, 963, 2222, 44, 354, "Output"]
}, Open  ]]
}, Open  ]]
}, Open  ]]
}, Open  ]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature fxDh#9JTTEGNDDKIDZkVQVBs *)
