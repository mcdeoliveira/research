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
NotebookDataLength[     22676,        658]
NotebookOptionsPosition[     21462,        593]
NotebookOutlinePosition[     21961,        615]
CellTagsIndexPosition[     21918,        612]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{

Cell[CellGroupData[{
Cell["System Response", "Title", "PluginEmbeddedContent"],

Cell["MAE 143 B", "Subsubtitle", "PluginEmbeddedContent"],

Cell["Mauricio de Oliveira", "Subsubtitle", "PluginEmbeddedContent"],

Cell[CellGroupData[{

Cell["Second-order System III", "Section", "PluginEmbeddedContent"],

Cell[CellGroupData[{

Cell["Impulse Response", "Subsection", "PluginEmbeddedContent"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"G", "=", 
  RowBox[{
   SuperscriptBox["\[Omega]", "2"], "/", 
   RowBox[{"(", 
    RowBox[{
     SuperscriptBox["s", "2"], "+", 
     RowBox[{"2", "\[Xi]", " ", "\[Omega]", " ", "s"}], "+", 
     RowBox[{"\[Omega]", "^", "2"}]}], ")"}]}]}]], "Input", \
"PluginEmbeddedContent"],

Cell[BoxData[
 FractionBox[
  SuperscriptBox["\[Omega]", "2"], 
  RowBox[{
   SuperscriptBox["s", "2"], "+", 
   RowBox[{"2", " ", "s", " ", "\[Xi]", " ", "\[Omega]"}], "+", 
   SuperscriptBox["\[Omega]", "2"]}]]], "Output", "PluginEmbeddedContent"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"FullSimplify", "[", 
  RowBox[{"InverseLaplaceTransform", "[", 
   RowBox[{"G", ",", "s", ",", "t"}], "]"}], "]"}]], "Input", \
"PluginEmbeddedContent"],

Cell[BoxData[
 FractionBox[
  RowBox[{
   SuperscriptBox["\[ExponentialE]", 
    RowBox[{
     RowBox[{"-", "t"}], " ", 
     RowBox[{"(", 
      RowBox[{
       RowBox[{"\[Xi]", " ", "\[Omega]"}], "+", 
       SqrtBox[
        RowBox[{
         RowBox[{"(", 
          RowBox[{
           RowBox[{"-", "1"}], "+", 
           SuperscriptBox["\[Xi]", "2"]}], ")"}], " ", 
         SuperscriptBox["\[Omega]", "2"]}]]}], ")"}]}]], " ", 
   RowBox[{"(", 
    RowBox[{
     RowBox[{"-", "1"}], "+", 
     SuperscriptBox["\[ExponentialE]", 
      RowBox[{"2", " ", "t", " ", 
       SqrtBox[
        RowBox[{
         RowBox[{"(", 
          RowBox[{
           RowBox[{"-", "1"}], "+", 
           SuperscriptBox["\[Xi]", "2"]}], ")"}], " ", 
         SuperscriptBox["\[Omega]", "2"]}]]}]]}], ")"}], " ", 
   SuperscriptBox["\[Omega]", "2"]}], 
  RowBox[{"2", " ", 
   SqrtBox[
    RowBox[{
     RowBox[{"(", 
      RowBox[{
       RowBox[{"-", "1"}], "+", 
       SuperscriptBox["\[Xi]", "2"]}], ")"}], " ", 
     SuperscriptBox["\[Omega]", "2"]}]]}]]], "Output", \
"PluginEmbeddedContent"]
}, Open  ]],

Cell["\<\
Experiment with the impulse response in the interactive plot.
Try \[Xi] > 1 and \[Xi] < 0 and vary T.\
\>", "Text", "PluginEmbeddedContent",
 FontSize->16],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Manipulate", "[", "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Plot", "[", "\[IndentingNewLine]", 
    RowBox[{
     RowBox[{"{", 
      FractionBox[
       RowBox[{
        SuperscriptBox["\[ExponentialE]", 
         RowBox[{
          RowBox[{"-", "t"}], " ", 
          RowBox[{"(", 
           RowBox[{
            RowBox[{"\[Xi]", " ", "\[Omega]"}], "+", 
            SqrtBox[
             RowBox[{
              RowBox[{"(", 
               RowBox[{
                RowBox[{"-", "1"}], "+", 
                SuperscriptBox["\[Xi]", "2"]}], ")"}], " ", 
              SuperscriptBox["\[Omega]", "2"]}]]}], ")"}]}]], " ", 
        RowBox[{"(", 
         RowBox[{
          RowBox[{"-", "1"}], "+", 
          SuperscriptBox["\[ExponentialE]", 
           RowBox[{"2", " ", "t", " ", 
            SqrtBox[
             RowBox[{
              RowBox[{"(", 
               RowBox[{
                RowBox[{"-", "1"}], "+", 
                SuperscriptBox["\[Xi]", "2"]}], ")"}], " ", 
              SuperscriptBox["\[Omega]", "2"]}]]}]]}], ")"}], " ", 
        SuperscriptBox["\[Omega]", "2"]}], 
       RowBox[{"2", " ", 
        SqrtBox[
         RowBox[{
          RowBox[{"(", 
           RowBox[{
            RowBox[{"-", "1"}], "+", 
            SuperscriptBox["\[Xi]", "2"]}], ")"}], " ", 
          SuperscriptBox["\[Omega]", "2"]}]]}]], "}"}], "\[IndentingNewLine]",
      ",", "\[IndentingNewLine]", 
     RowBox[{"{", 
      RowBox[{"t", ",", "0", ",", "T"}], "}"}], ",", "\[IndentingNewLine]", 
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
          RowBox[{"\"\<\[Omega] = \>\"", "<>", 
           RowBox[{"ToString", "[", "\[Omega]", "]"}], "<>", 
           "\"\<, \[Xi] = \>\"", "<>", 
           RowBox[{"ToString", "[", "\[Xi]", "]"}]}]}], "}"}]}], 
       "\[IndentingNewLine]", "}"}]}]}], "\[IndentingNewLine]", "]"}], 
   "\[IndentingNewLine]", ",", "\[IndentingNewLine]", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"\[Omega]", ",", "1", ",", "\"\<\[Omega]\>\""}], "}"}], ",", 
     "0.01", ",", "2"}], "}"}], ",", "\[IndentingNewLine]", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"\[Xi]", ",", ".5", ",", "\"\<\[Xi]\>\""}], "}"}], ",", 
     RowBox[{"-", "2"}], ",", "2"}], "}"}], ",", "\[IndentingNewLine]", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"T", ",", "10", ",", "\"\<T\>\""}], "}"}], ",", "1", ",", 
     "100"}], "}"}]}], "\[IndentingNewLine]", "]"}]], "Input", \
"PluginEmbeddedContent",
 CellOpen->False],

Cell[BoxData[
 TagBox[
  StyleBox[
   DynamicModuleBox[{$CellContext`T$$ = 10, $CellContext`\[Xi]$$ = 
    0.5, $CellContext`\[Omega]$$ = 1, Typeset`show$$ = True, 
    Typeset`bookmarkList$$ = {}, Typeset`bookmarkMode$$ = "Menu", 
    Typeset`animator$$, Typeset`animvar$$ = 1, Typeset`name$$ = 
    "\"untitled\"", Typeset`specs$$ = {{{
       Hold[$CellContext`\[Omega]$$], 1, "\[Omega]"}, 0.01, 2}, {{
       Hold[$CellContext`\[Xi]$$], 0.5, "\[Xi]"}, -2, 2}, {{
       Hold[$CellContext`T$$], 10, "T"}, 1, 100}}, Typeset`size$$ = {
    360., {115., 120.}}, Typeset`update$$ = 0, Typeset`initDone$$, 
    Typeset`skipInitDone$$ = True, $CellContext`\[Omega]$1366$$ = 
    0, $CellContext`\[Xi]$1367$$ = 0, $CellContext`T$1368$$ = 0}, 
    DynamicBox[Manipulate`ManipulateBoxes[
     1, StandardForm, 
      "Variables" :> {$CellContext`T$$ = 10, $CellContext`\[Xi]$$ = 
        0.5, $CellContext`\[Omega]$$ = 1}, "ControllerVariables" :> {
        Hold[$CellContext`\[Omega]$$, $CellContext`\[Omega]$1366$$, 0], 
        Hold[$CellContext`\[Xi]$$, $CellContext`\[Xi]$1367$$, 0], 
        Hold[$CellContext`T$$, $CellContext`T$1368$$, 0]}, 
      "OtherVariables" :> {
       Typeset`show$$, Typeset`bookmarkList$$, Typeset`bookmarkMode$$, 
        Typeset`animator$$, Typeset`animvar$$, Typeset`name$$, 
        Typeset`specs$$, Typeset`size$$, Typeset`update$$, Typeset`initDone$$,
         Typeset`skipInitDone$$}, "Body" :> 
      Plot[{E^((-$CellContext`t) ($CellContext`\[Xi]$$ \
$CellContext`\[Omega]$$ + ((-1 + $CellContext`\[Xi]$$^2) \
$CellContext`\[Omega]$$^2)^Rational[1, 2])) (-1 + 
          E^(2 $CellContext`t ((-1 + $CellContext`\[Xi]$$^2) $CellContext`\
\[Omega]$$^2)^Rational[1, 2])) $CellContext`\[Omega]$$^2/(
         2 ((-1 + $CellContext`\[Xi]$$^2) $CellContext`\[Omega]$$^2)^
          Rational[1, 2])}, {$CellContext`t, 0, $CellContext`T$$}, 
        PlotStyle -> {Blue}, PlotRange -> All, GridLines -> Automatic, Frame -> 
        True, FrameLabel -> {{"y(t)", ""}, {"t", 
           StringJoin["\[Omega] = ", 
            ToString[$CellContext`\[Omega]$$], ", \[Xi] = ", 
            ToString[$CellContext`\[Xi]$$]]}}], 
      "Specifications" :> {{{$CellContext`\[Omega]$$, 1, "\[Omega]"}, 0.01, 
         2}, {{$CellContext`\[Xi]$$, 0.5, "\[Xi]"}, -2, 
         2}, {{$CellContext`T$$, 10, "T"}, 1, 100}}, "Options" :> {}, 
      "DefaultOptions" :> {}],
     ImageSizeCache->{403., {185., 191.}},
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
 RowBox[{"FullSimplify", "[", 
  RowBox[{"InverseLaplaceTransform", "[", 
   RowBox[{
    RowBox[{"G", "/", "s"}], ",", "s", ",", "t"}], "]"}], "]"}]], "Input", \
"PluginEmbeddedContent"],

Cell[BoxData[
 RowBox[{
  FractionBox["1", 
   RowBox[{"2", " ", 
    RowBox[{"(", 
     RowBox[{
      RowBox[{"-", "1"}], "+", 
      SuperscriptBox["\[Xi]", "2"]}], ")"}], " ", "\[Omega]"}]], 
  RowBox[{
   SuperscriptBox["\[ExponentialE]", 
    RowBox[{
     RowBox[{"-", "t"}], " ", 
     RowBox[{"(", 
      RowBox[{
       RowBox[{"\[Xi]", " ", "\[Omega]"}], "+", 
       SqrtBox[
        RowBox[{
         RowBox[{"(", 
          RowBox[{
           RowBox[{"-", "1"}], "+", 
           SuperscriptBox["\[Xi]", "2"]}], ")"}], " ", 
         SuperscriptBox["\[Omega]", "2"]}]]}], ")"}]}]], " ", 
   RowBox[{"(", 
    RowBox[{
     RowBox[{
      RowBox[{"-", 
       RowBox[{"(", 
        RowBox[{"1", "+", 
         SuperscriptBox["\[ExponentialE]", 
          RowBox[{"2", " ", "t", " ", 
           SqrtBox[
            RowBox[{
             RowBox[{"(", 
              RowBox[{
               RowBox[{"-", "1"}], "+", 
               SuperscriptBox["\[Xi]", "2"]}], ")"}], " ", 
             SuperscriptBox["\[Omega]", "2"]}]]}]], "-", 
         RowBox[{"2", " ", 
          SuperscriptBox["\[ExponentialE]", 
           RowBox[{"t", " ", 
            RowBox[{"(", 
             RowBox[{
              RowBox[{"\[Xi]", " ", "\[Omega]"}], "+", 
              SqrtBox[
               RowBox[{
                RowBox[{"(", 
                 RowBox[{
                  RowBox[{"-", "1"}], "+", 
                  SuperscriptBox["\[Xi]", "2"]}], ")"}], " ", 
                SuperscriptBox["\[Omega]", "2"]}]]}], ")"}]}]]}]}], ")"}]}], 
      " ", 
      RowBox[{"(", 
       RowBox[{
        RowBox[{"-", "1"}], "+", 
        SuperscriptBox["\[Xi]", "2"]}], ")"}], " ", "\[Omega]"}], "-", 
     RowBox[{
      RowBox[{"(", 
       RowBox[{
        RowBox[{"-", "1"}], "+", 
        SuperscriptBox["\[ExponentialE]", 
         RowBox[{"2", " ", "t", " ", 
          SqrtBox[
           RowBox[{
            RowBox[{"(", 
             RowBox[{
              RowBox[{"-", "1"}], "+", 
              SuperscriptBox["\[Xi]", "2"]}], ")"}], " ", 
            SuperscriptBox["\[Omega]", "2"]}]]}]]}], ")"}], " ", "\[Xi]", " ", 
      SqrtBox[
       RowBox[{
        RowBox[{"(", 
         RowBox[{
          RowBox[{"-", "1"}], "+", 
          SuperscriptBox["\[Xi]", "2"]}], ")"}], " ", 
        SuperscriptBox["\[Omega]", "2"]}]]}]}], ")"}]}]}]], "Output", \
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
      RowBox[{"1", ",", 
       RowBox[{
        FractionBox["1", 
         RowBox[{"2", " ", 
          RowBox[{"(", 
           RowBox[{
            RowBox[{"-", "1"}], "+", 
            SuperscriptBox["\[Xi]", "2"]}], ")"}], " ", "\[Omega]"}]], 
        SuperscriptBox["\[ExponentialE]", 
         RowBox[{
          RowBox[{"-", "t"}], " ", 
          RowBox[{"(", 
           RowBox[{
            RowBox[{"\[Xi]", " ", "\[Omega]"}], "+", 
            SqrtBox[
             RowBox[{
              RowBox[{"(", 
               RowBox[{
                RowBox[{"-", "1"}], "+", 
                SuperscriptBox["\[Xi]", "2"]}], ")"}], " ", 
              SuperscriptBox["\[Omega]", "2"]}]]}], ")"}]}]], " ", 
        RowBox[{"(", 
         RowBox[{
          RowBox[{
           RowBox[{"-", 
            RowBox[{"(", 
             RowBox[{"1", "+", 
              SuperscriptBox["\[ExponentialE]", 
               RowBox[{"2", " ", "t", " ", 
                SqrtBox[
                 RowBox[{
                  RowBox[{"(", 
                   RowBox[{
                    RowBox[{"-", "1"}], "+", 
                    SuperscriptBox["\[Xi]", "2"]}], ")"}], " ", 
                  SuperscriptBox["\[Omega]", "2"]}]]}]], "-", 
              RowBox[{"2", " ", 
               SuperscriptBox["\[ExponentialE]", 
                RowBox[{"t", " ", 
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{"\[Xi]", " ", "\[Omega]"}], "+", 
                   SqrtBox[
                    RowBox[{
                    RowBox[{"(", 
                    RowBox[{
                    RowBox[{"-", "1"}], "+", 
                    SuperscriptBox["\[Xi]", "2"]}], ")"}], " ", 
                    SuperscriptBox["\[Omega]", "2"]}]]}], ")"}]}]]}]}], 
             ")"}]}], " ", 
           RowBox[{"(", 
            RowBox[{
             RowBox[{"-", "1"}], "+", 
             SuperscriptBox["\[Xi]", "2"]}], ")"}], " ", "\[Omega]"}], "-", 
          RowBox[{
           RowBox[{"(", 
            RowBox[{
             RowBox[{"-", "1"}], "+", 
             SuperscriptBox["\[ExponentialE]", 
              RowBox[{"2", " ", "t", " ", 
               SqrtBox[
                RowBox[{
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{"-", "1"}], "+", 
                   SuperscriptBox["\[Xi]", "2"]}], ")"}], " ", 
                 SuperscriptBox["\[Omega]", "2"]}]]}]]}], ")"}], " ", "\[Xi]",
            " ", 
           SqrtBox[
            RowBox[{
             RowBox[{"(", 
              RowBox[{
               RowBox[{"-", "1"}], "+", 
               SuperscriptBox["\[Xi]", "2"]}], ")"}], " ", 
             SuperscriptBox["\[Omega]", "2"]}]]}]}], ")"}]}]}], "}"}], 
     "\[IndentingNewLine]", ",", "\[IndentingNewLine]", 
     RowBox[{"{", 
      RowBox[{"t", ",", "0", ",", "T"}], "}"}], ",", "\[IndentingNewLine]", 
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
          RowBox[{"\"\<\[Omega] = \>\"", "<>", 
           RowBox[{"ToString", "[", "\[Omega]", "]"}], "<>", 
           "\"\<, \[Xi] = \>\"", "<>", 
           RowBox[{"ToString", "[", "\[Xi]", "]"}]}]}], "}"}]}], 
       "\[IndentingNewLine]", "}"}]}]}], "\[IndentingNewLine]", "]"}], 
   "\[IndentingNewLine]", ",", "\[IndentingNewLine]", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"\[Omega]", ",", "1", ",", "\"\<\[Omega]\>\""}], "}"}], ",", 
     "0.01", ",", "2"}], "}"}], ",", "\[IndentingNewLine]", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"\[Xi]", ",", ".5", ",", "\"\<\[Xi]\>\""}], "}"}], ",", "0", 
     ",", "2"}], "}"}], ",", "\[IndentingNewLine]", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"T", ",", "10", ",", "\"\<T\>\""}], "}"}], ",", "1", ",", 
     "100"}], "}"}]}], "\[IndentingNewLine]", "]"}]], "Input", \
"PluginEmbeddedContent",
 CellOpen->False],

Cell[BoxData[
 TagBox[
  StyleBox[
   DynamicModuleBox[{$CellContext`T$$ = 10, $CellContext`\[Xi]$$ = 
    0.5, $CellContext`\[Omega]$$ = 1, Typeset`show$$ = True, 
    Typeset`bookmarkList$$ = {}, Typeset`bookmarkMode$$ = "Menu", 
    Typeset`animator$$, Typeset`animvar$$ = 1, Typeset`name$$ = 
    "\"untitled\"", Typeset`specs$$ = {{{
       Hold[$CellContext`\[Omega]$$], 1, "\[Omega]"}, 0.01, 2}, {{
       Hold[$CellContext`\[Xi]$$], 0.5, "\[Xi]"}, 0, 2}, {{
       Hold[$CellContext`T$$], 10, "T"}, 1, 100}}, Typeset`size$$ = {
    360., {117., 122.}}, Typeset`update$$ = 0, Typeset`initDone$$, 
    Typeset`skipInitDone$$ = True, $CellContext`\[Omega]$2018$$ = 
    0, $CellContext`\[Xi]$2019$$ = 0, $CellContext`T$2020$$ = 0}, 
    DynamicBox[Manipulate`ManipulateBoxes[
     1, StandardForm, 
      "Variables" :> {$CellContext`T$$ = 10, $CellContext`\[Xi]$$ = 
        0.5, $CellContext`\[Omega]$$ = 1}, "ControllerVariables" :> {
        Hold[$CellContext`\[Omega]$$, $CellContext`\[Omega]$2018$$, 0], 
        Hold[$CellContext`\[Xi]$$, $CellContext`\[Xi]$2019$$, 0], 
        Hold[$CellContext`T$$, $CellContext`T$2020$$, 0]}, 
      "OtherVariables" :> {
       Typeset`show$$, Typeset`bookmarkList$$, Typeset`bookmarkMode$$, 
        Typeset`animator$$, Typeset`animvar$$, Typeset`name$$, 
        Typeset`specs$$, Typeset`size$$, Typeset`update$$, Typeset`initDone$$,
         Typeset`skipInitDone$$}, "Body" :> 
      Plot[{1, (1/(2 (-1 + $CellContext`\[Xi]$$^2) $CellContext`\[Omega]$$)) 
         E^((-$CellContext`t) ($CellContext`\[Xi]$$ $CellContext`\[Omega]$$ + \
((-1 + $CellContext`\[Xi]$$^2) $CellContext`\[Omega]$$^2)^
             Rational[1, 2])) ((-(1 + 
             E^(2 $CellContext`t ((-1 + $CellContext`\[Xi]$$^2) $CellContext`\
\[Omega]$$^2)^Rational[1, 2]) - 2 
             E^($CellContext`t ($CellContext`\[Xi]$$ $CellContext`\[Omega]$$ + \
((-1 + $CellContext`\[Xi]$$^2) $CellContext`\[Omega]$$^2)^
                 Rational[
                  1, 2])))) (-1 + $CellContext`\[Xi]$$^2) $CellContext`\
\[Omega]$$ - (-1 + 
           E^(2 $CellContext`t ((-1 + $CellContext`\[Xi]$$^2) $CellContext`\
\[Omega]$$^2)^Rational[
               1, 2])) $CellContext`\[Xi]$$ ((-1 + $CellContext`\[Xi]$$^2) \
$CellContext`\[Omega]$$^2)^Rational[1, 2])}, {$CellContext`t, 
         0, $CellContext`T$$}, PlotStyle -> {Dashed, Blue}, PlotRange -> All, 
        GridLines -> Automatic, Frame -> True, FrameLabel -> {{"y", ""}, {"t", 
           StringJoin["\[Omega] = ", 
            ToString[$CellContext`\[Omega]$$], ", \[Xi] = ", 
            ToString[$CellContext`\[Xi]$$]]}}], 
      "Specifications" :> {{{$CellContext`\[Omega]$$, 1, "\[Omega]"}, 0.01, 
         2}, {{$CellContext`\[Xi]$$, 0.5, "\[Xi]"}, 0, 
         2}, {{$CellContext`T$$, 10, "T"}, 1, 100}}, "Options" :> {}, 
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

Cell["Impulse Response (\[Omega] = 0)", "Subsection", "PluginEmbeddedContent"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"G", "=", 
  RowBox[{"1", "/", 
   SuperscriptBox["s", "2"]}]}]], "Input", "PluginEmbeddedContent"],

Cell[BoxData[
 FractionBox["1", 
  SuperscriptBox["s", "2"]]], "Output", "PluginEmbeddedContent"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"FullSimplify", "[", 
  RowBox[{"InverseLaplaceTransform", "[", 
   RowBox[{"G", ",", "s", ",", "t"}], "]"}], "]"}]], "Input", \
"PluginEmbeddedContent"],

Cell[BoxData["t"], "Output", "PluginEmbeddedContent"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["Step Response (\[Omega] = 0)", "Subsection", "PluginEmbeddedContent"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"FullSimplify", "[", 
  RowBox[{"InverseLaplaceTransform", "[", 
   RowBox[{
    RowBox[{"G", "/", "s"}], ",", "s", ",", "t"}], "]"}], "]"}]], "Input", \
"PluginEmbeddedContent"],

Cell[BoxData[
 FractionBox[
  SuperscriptBox["t", "2"], "2"]], "Output", "PluginEmbeddedContent"]
}, Open  ]]
}, Open  ]]
}, Open  ]]
}, Open  ]]
},
WindowSize->{694., 2217.8},
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
Cell[1470, 40, 67, 0, 25, "Section"],
Cell[CellGroupData[{
Cell[1562, 44, 63, 0, 14, "Subsection"],
Cell[CellGroupData[{
Cell[1650, 48, 302, 9, 18, "Input"],
Cell[1955, 59, 249, 6, 37, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[2241, 70, 176, 4, 12, "Input"],
Cell[2420, 76, 1087, 37, 84, "Output"]
}, Open  ]],
Cell[3522, 116, 165, 4, 35, "Text"],
Cell[CellGroupData[{
Cell[3712, 124, 3097, 81, 19, "Input",
 CellOpen->False],
Cell[6812, 207, 2773, 51, 378, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[9634, 264, 60, 0, 14, "Subsection"],
Cell[CellGroupData[{
Cell[9719, 268, 201, 5, 12, "Input"],
Cell[9923, 275, 2386, 75, 103, "Output"]
}, Open  ]],
Cell[12324, 353, 114, 1, 16, "Text"],
Cell[CellGroupData[{
Cell[12463, 358, 4621, 121, 19, "Input",
 CellOpen->False],
Cell[17087, 481, 3230, 59, 382, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[20366, 546, 78, 0, 14, "Subsection"],
Cell[CellGroupData[{
Cell[20469, 550, 122, 3, 18, "Input"],
Cell[20594, 555, 97, 2, 32, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[20728, 562, 176, 4, 12, "Input"],
Cell[20907, 568, 53, 0, 12, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[21009, 574, 75, 0, 14, "Subsection"],
Cell[CellGroupData[{
Cell[21109, 578, 201, 5, 12, "Input"],
Cell[21313, 585, 97, 2, 34, "Output"]
}, Open  ]]
}, Open  ]]
}, Open  ]]
}, Open  ]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature pvp9l863vkuuQBg8LTMcVMsn *)
