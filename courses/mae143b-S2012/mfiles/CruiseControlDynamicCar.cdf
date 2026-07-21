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
NotebookDataLength[     61541,       1651]
NotebookOptionsPosition[     59409,       1560]
NotebookOutlinePosition[     59932,       1582]
CellTagsIndexPosition[     59889,       1579]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{

Cell[CellGroupData[{
Cell["Cruise Control II", "Title", "PluginEmbeddedContent"],

Cell["MAE 143 B", "Subsubtitle", "PluginEmbeddedContent"],

Cell["Mauricio de Oliveira", "Subsubtitle", "PluginEmbeddedContent"],

Cell[CellGroupData[{

Cell["Model", "Section", "PluginEmbeddedContent"],

Cell[TextData[{
 "Car is represented by the simple dynamic model :\n\n\t",
 Cell[BoxData[
  RowBox[{
   RowBox[{"V", "[", "s", "]"}], "=", 
   RowBox[{
    RowBox[{"G", "[", "s", "]"}], 
    RowBox[{"U", "[", "s", "]"}], " "}]}]],
  CellChangeTimes->{3.542558680017943*^9}],
 "\n\nafter using the Laplace Transform. G[s] is the open loop transfer \
function\n\n  \t",
 Cell[BoxData[
  RowBox[{
   RowBox[{"G", "[", "s", "]"}], "=", 
   FractionBox[
    RowBox[{
     SubscriptBox["k", "p"], "/", "m"}], 
    RowBox[{"s", "+", 
     RowBox[{"b", "/", "m"}]}]]}]],
  CellChangeTimes->{3.542558680017943*^9}],
 "\n  \nwhere\n\n  v: car speed\n  u: gas pedal excursion\n  \n  m: car mass\n\
  ",
 Cell[BoxData[
  FormBox[
   SubscriptBox["k", "p"], TraditionalForm]]],
 ": gain from pedal excursion to force\n  b: viscuous friction coefficient\n  \
\nThe constants \[OpenCurlyQuote]",
 Cell[BoxData[
  FormBox[
   SubscriptBox["k", "p"], TraditionalForm]]],
 "\[CloseCurlyQuote], \[OpenCurlyQuote]m\[CloseCurlyQuote] and \
\[OpenCurlyQuote]b\[CloseCurlyQuote] will have to be expressed in proper \
units.\n\nFor convinience we will work with the parameters\n\n\t",
 Cell[BoxData[
  RowBox[{
   RowBox[{"\[Alpha]", "=", 
    FractionBox[
     SubscriptBox["k", "p"], "m"]}], ",", " ", 
   RowBox[{"\[Beta]", "=", 
    FractionBox["b", "m"]}]}]],
  CellChangeTimes->{3.542558680017943*^9}],
 "\n\ninstead of m, ",
 Cell[BoxData[
  FormBox[
   SubscriptBox["k", "p"], TraditionalForm]]],
 ", and b. Hence\n\n\t",
 Cell[BoxData[
  RowBox[{
   RowBox[{"G", "[", "s", "]"}], "=", 
   FractionBox["\[Alpha]", 
    RowBox[{"s", "+", "\[Beta]"}]]}]],
  CellChangeTimes->{3.542558680017943*^9}],
 "\n\nOur goal is to drive the car to a given speed ",
 Cell[BoxData[
  OverscriptBox["v", "_"]],
  CellChangeTimes->{{3.542558242365675*^9, 3.542558256334731*^9}}],
 " using feedback control.\n\nFor better formating we use ",
 StyleBox["Mathematica",
  FontSlant->"Italic"],
 "\[CloseCurlyQuote]s functional notation with brackets instead of the more \
standard parenthesis."
}], "Text", "PluginEmbeddedContent",
 FontSize->16]
}, Open  ]],

Cell[CellGroupData[{

Cell["Open loop response", "Section", "PluginEmbeddedContent"],

Cell["\<\
We will first look at the open loop response. The open - loop transfer \
function is\
\>", "Text", "PluginEmbeddedContent",
 FontSize->16],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"G", "=", 
  RowBox[{"Simplify", "[", 
   RowBox[{"\[Alpha]", "/", 
    RowBox[{"(", 
     RowBox[{"s", "+", "\[Beta]"}], ")"}]}], "]"}]}]], "Input", \
"PluginEmbeddedContent"],

Cell[BoxData[
 FractionBox["\[Alpha]", 
  RowBox[{"s", "+", "\[Beta]"}]]], "Output", "PluginEmbeddedContent"]
}, Open  ]],

Cell[TextData[{
 "The open-loop response to a step (denoted 1[t]) of size ",
 Cell[BoxData[
  OverscriptBox["u", "_"]],
  CellChangeTimes->{{3.542558242365675*^9, 3.542558256334731*^9}}],
 " can be shown to be equal to\n\n\t",
 Cell[BoxData[
  RowBox[{
   RowBox[{"v", "[", "t", "]"}], "=", 
   RowBox[{
    FractionBox[
     RowBox[{
      OverscriptBox["u", "_"], "\[Alpha]"}], "\[Beta]"], 
    RowBox[{"(", 
     RowBox[{"1", "-", 
      SuperscriptBox["E", 
       RowBox[{
        RowBox[{"-", "\[Beta]"}], " ", "t"}]]}], ")"}], 
    RowBox[{"1", "[", "t", "]"}]}]}]],
  CellChangeTimes->{3.542558680017943*^9}],
 "\n\nWe calculate this response using ",
 StyleBox["Mathematica",
  FontSlant->"Italic"]
}], "Text", "PluginEmbeddedContent",
 FontSize->16],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{"Clear", "[", "v", "]"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"v", "[", "t_", "]"}], "=", 
  RowBox[{"Collect", "[", 
   RowBox[{
    RowBox[{"Simplify", "[", 
     RowBox[{"InverseLaplaceTransform", "[", 
      RowBox[{
       RowBox[{"G", 
        RowBox[{
         OverscriptBox["u", "_"], " ", "/", "s"}]}], ",", "s", ",", "t"}], 
      "]"}], "]"}], ",", 
    RowBox[{"{", 
     RowBox[{"\[Alpha]", ",", 
      OverscriptBox["u", "_"]}], " ", "}"}]}], "]"}]}]}], "Input", \
"PluginEmbeddedContent"],

Cell[BoxData[
 FractionBox[
  RowBox[{
   RowBox[{"(", 
    RowBox[{"1", "-", 
     SuperscriptBox["\[ExponentialE]", 
      RowBox[{
       RowBox[{"-", "t"}], " ", "\[Beta]"}]]}], ")"}], " ", "\[Alpha]", " ", 
   OverscriptBox["u", "_"]}], "\[Beta]"]], "Output", "PluginEmbeddedContent"]
}, Open  ]],

Cell["We explore the response v[t] in the next interactive plot:", "Text", "PluginEmbeddedContent",
 FontSize->16],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Manipulate", "[", "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Show", "[", "\[IndentingNewLine]", 
    RowBox[{
     RowBox[{"Plot", "[", "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"uBar", ",", 
         RowBox[{"uBar", " ", 
          RowBox[{"kp", "/", "b"}]}], ",", 
         RowBox[{
          RowBox[{"(", 
           RowBox[{"1", "-", 
            RowBox[{"Exp", "[", 
             RowBox[{
              RowBox[{"-", 
               RowBox[{"(", 
                RowBox[{"b", "/", "m"}], ")"}]}], " ", "t"}], "]"}]}], ")"}], 
          "uBar", " ", 
          RowBox[{"kp", "/", "b"}]}]}], "}"}], "\[IndentingNewLine]", ",", 
       "\[IndentingNewLine]", 
       RowBox[{"{", 
        RowBox[{"t", ",", "0", ",", "T"}], "}"}], ",", "\[IndentingNewLine]", 
       
       RowBox[{"PlotStyle", "\[Rule]", 
        RowBox[{"{", 
         RowBox[{
          RowBox[{"Directive", "[", 
           RowBox[{"Green", ",", "Dashed"}], "]"}], ",", 
          RowBox[{"Directive", "[", 
           RowBox[{"Red", ",", "Dashed"}], "]"}], ",", "Blue"}], "}"}]}], ",",
        "\[IndentingNewLine]", 
       RowBox[{"PlotRange", "\[Rule]", 
        RowBox[{"{", 
         RowBox[{"0", ",", 
          RowBox[{"1.1", " ", 
           RowBox[{"Max", "[", 
            RowBox[{
             RowBox[{"(", 
              RowBox[{"kp", " ", 
               RowBox[{"uBar", "/", "b"}]}], ")"}], ",", "uBar"}], "]"}]}]}], 
         "}"}]}], ",", "\[IndentingNewLine]", 
       RowBox[{"GridLines", "\[Rule]", "Automatic"}], ",", 
       "\[IndentingNewLine]", 
       RowBox[{"Frame", "\[Rule]", "True"}], ",", "\[IndentingNewLine]", 
       RowBox[{"FrameLabel", "\[Rule]", 
        RowBox[{"{", "\[IndentingNewLine]", 
         RowBox[{
          RowBox[{"{", 
           RowBox[{"\"\<v (m/s)\>\"", ",", "\"\<\>\""}], "}"}], ",", 
          "\[IndentingNewLine]", 
          RowBox[{"{", 
           RowBox[{"\"\<t (s)\>\"", ",", 
            RowBox[{"\"\<\!\(\*SubscriptBox[\(k\), \(p\)]\) = \>\"", "<>", 
             RowBox[{"ToString", "[", "kp", "]"}], "<>", "\"\<, b = \>\"", "<>", 
             RowBox[{"ToString", "[", "b", "]"}], "<>", "\"\<, m = \>\"", "<>", 
             RowBox[{"ToString", "[", "m", "]"}], "<>", 
             "\"\<\\t(\[Alpha],\[Beta])=(\>\"", "<>", 
             RowBox[{"ToString", "[", 
              RowBox[{"Round", "[", 
               RowBox[{
                RowBox[{"kp", "/", "m"}], ",", "0.01"}], "]"}], "]"}], "<>", 
             "\"\<,\>\"", "<>", 
             RowBox[{"ToString", "[", 
              RowBox[{"Round", "[", 
               RowBox[{
                RowBox[{"b", "/", "m"}], ",", "0.01"}], "]"}], "]"}], "<>", 
             "\"\<)\>\""}]}], "}"}]}], "\[IndentingNewLine]", "}"}]}]}], 
      "\[IndentingNewLine]", "]"}], ",", "\[IndentingNewLine]", 
     RowBox[{"Graphics", "[", 
      RowBox[{"Text", "[", 
       RowBox[{
       "\"\<\!\(\*OverscriptBox[\(u\), \(_\)]\) \!\(\*SubscriptBox[\(k\), \(p\
\)]\)/b\>\"", ",", 
        RowBox[{"{", 
         RowBox[{
          RowBox[{".9", " ", "T"}], ",", 
          RowBox[{
           RowBox[{"(", 
            RowBox[{"kp", " ", 
             RowBox[{"uBar", "/", "b"}]}], ")"}], "+", 
           RowBox[{".05", 
            RowBox[{"Max", "[", 
             RowBox[{
              RowBox[{"(", 
               RowBox[{"kp", " ", 
                RowBox[{"uBar", "/", "b"}]}], ")"}], ",", "uBar"}], 
             "]"}]}]}]}], "}"}]}], "]"}], "]"}], ",", "\[IndentingNewLine]", 
     RowBox[{"Graphics", "[", 
      RowBox[{"Text", "[", 
       RowBox[{"\"\<\!\(\*OverscriptBox[\(u\), \(_\)]\)\>\"", ",", 
        RowBox[{"{", 
         RowBox[{
          RowBox[{".9", "T"}], ",", 
          RowBox[{"uBar", "+", 
           RowBox[{".05", 
            RowBox[{"Max", "[", 
             RowBox[{
              RowBox[{"(", 
               RowBox[{"kp", " ", 
                RowBox[{"uBar", "/", "b"}]}], ")"}], ",", "uBar"}], 
             "]"}]}]}]}], "}"}]}], "]"}], "]"}]}], "\[IndentingNewLine]", 
    "]"}], "\[IndentingNewLine]", ",", "\[IndentingNewLine]", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
      "uBar", ",", "1", ",", 
       "\"\<Input Magnitude (\!\(\*OverscriptBox[\(u\), \(_\)]\))\>\""}], 
      "}"}], ",", "1", ",", "10"}], "}"}], ",", "\[IndentingNewLine]", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
      "kp", ",", "1", ",", 
       "\"\<Pedal Gain (\!\(\*SubscriptBox[\(k\), \(p\)]\))\>\""}], "}"}], 
     ",", "0", ",", "10"}], "}"}], ",", "\[IndentingNewLine]", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"b", ",", "2", ",", "\"\<Friction coefficient (b)\>\""}], "}"}],
      ",", "0.1", ",", "10"}], "}"}], ",", "\[IndentingNewLine]", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"m", ",", "1", ",", "\"\<Car Mass (m)\>\""}], "}"}], ",", "0.1",
      ",", "10"}], "}"}], ",", "\[IndentingNewLine]", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"T", ",", "10", ",", "\"\<Simulation time (T)\>\""}], "}"}], 
     ",", ".1", ",", "100"}], "}"}]}], "\[IndentingNewLine]", "]"}]], "Input",\
 "PluginEmbeddedContent",
 CellOpen->False],

Cell[BoxData[
 TagBox[
  StyleBox[
   DynamicModuleBox[{$CellContext`b$$ = 2, $CellContext`kp$$ = 
    1, $CellContext`m$$ = 1, $CellContext`T$$ = 10, $CellContext`uBar$$ = 1, 
    Typeset`show$$ = True, Typeset`bookmarkList$$ = {}, 
    Typeset`bookmarkMode$$ = "Menu", Typeset`animator$$, Typeset`animvar$$ = 
    1, Typeset`name$$ = "\"untitled\"", Typeset`specs$$ = {{{
       Hold[$CellContext`uBar$$], 1, 
       "Input Magnitude (\!\(\*OverscriptBox[\(u\), \(_\)]\))"}, 1, 10}, {{
       Hold[$CellContext`kp$$], 1, 
       "Pedal Gain (\!\(\*SubscriptBox[\(k\), \(p\)]\))"}, 0, 10}, {{
       Hold[$CellContext`b$$], 2, "Friction coefficient (b)"}, 0.1, 10}, {{
       Hold[$CellContext`m$$], 1, "Car Mass (m)"}, 0.1, 10}, {{
       Hold[$CellContext`T$$], 10, "Simulation time (T)"}, 0.1, 100}}, 
    Typeset`size$$ = {360., {119., 124.}}, Typeset`update$$ = 0, 
    Typeset`initDone$$, Typeset`skipInitDone$$ = 
    True, $CellContext`uBar$1339$$ = 0, $CellContext`kp$1340$$ = 
    0, $CellContext`b$1341$$ = 0, $CellContext`m$1342$$ = 
    0, $CellContext`T$1343$$ = 0}, 
    DynamicBox[Manipulate`ManipulateBoxes[
     1, StandardForm, 
      "Variables" :> {$CellContext`b$$ = 2, $CellContext`kp$$ = 
        1, $CellContext`m$$ = 1, $CellContext`T$$ = 10, $CellContext`uBar$$ = 
        1}, "ControllerVariables" :> {
        Hold[$CellContext`uBar$$, $CellContext`uBar$1339$$, 0], 
        Hold[$CellContext`kp$$, $CellContext`kp$1340$$, 0], 
        Hold[$CellContext`b$$, $CellContext`b$1341$$, 0], 
        Hold[$CellContext`m$$, $CellContext`m$1342$$, 0], 
        Hold[$CellContext`T$$, $CellContext`T$1343$$, 0]}, 
      "OtherVariables" :> {
       Typeset`show$$, Typeset`bookmarkList$$, Typeset`bookmarkMode$$, 
        Typeset`animator$$, Typeset`animvar$$, Typeset`name$$, 
        Typeset`specs$$, Typeset`size$$, Typeset`update$$, Typeset`initDone$$,
         Typeset`skipInitDone$$}, "Body" :> Show[
        Plot[{$CellContext`uBar$$, $CellContext`uBar$$ \
($CellContext`kp$$/$CellContext`b$$), (1 - 
           Exp[(-($CellContext`b$$/$CellContext`m$$)) $CellContext`t]) \
$CellContext`uBar$$ ($CellContext`kp$$/$CellContext`b$$)}, {$CellContext`t, 
          0, $CellContext`T$$}, PlotStyle -> {
           Directive[Green, Dashed], 
           Directive[Red, Dashed], Blue}, 
         PlotRange -> {
          0, 1.1 Max[$CellContext`kp$$ \
($CellContext`uBar$$/$CellContext`b$$), $CellContext`uBar$$]}, GridLines -> 
         Automatic, Frame -> True, FrameLabel -> {{"v (m/s)", ""}, {"t (s)", 
            StringJoin["\!\(\*SubscriptBox[\(k\), \(p\)]\) = ", 
             ToString[$CellContext`kp$$], ", b = ", 
             ToString[$CellContext`b$$], ", m = ", 
             ToString[$CellContext`m$$], "\t(\[Alpha],\[Beta])=(", 
             ToString[
              Round[$CellContext`kp$$/$CellContext`m$$, 0.01]], ",", 
             ToString[
              Round[$CellContext`b$$/$CellContext`m$$, 0.01]], ")"]}}], 
        Graphics[
         Text[
         "\!\(\*OverscriptBox[\(u\), \(_\)]\) \!\(\*SubscriptBox[\(k\), \
\(p\)]\)/b", {
          0.9 $CellContext`T$$, $CellContext`kp$$ \
($CellContext`uBar$$/$CellContext`b$$) + 
           0.05 Max[$CellContext`kp$$ ($CellContext`uBar$$/$CellContext`b$$), \
$CellContext`uBar$$]}]], 
        Graphics[
         Text[
         "\!\(\*OverscriptBox[\(u\), \(_\)]\)", {
          0.9 $CellContext`T$$, $CellContext`uBar$$ + 
           0.05 Max[$CellContext`kp$$ ($CellContext`uBar$$/$CellContext`b$$), \
$CellContext`uBar$$]}]]], 
      "Specifications" :> {{{$CellContext`uBar$$, 1, 
          "Input Magnitude (\!\(\*OverscriptBox[\(u\), \(_\)]\))"}, 1, 
         10}, {{$CellContext`kp$$, 1, 
          "Pedal Gain (\!\(\*SubscriptBox[\(k\), \(p\)]\))"}, 0, 
         10}, {{$CellContext`b$$, 2, "Friction coefficient (b)"}, 0.1, 
         10}, {{$CellContext`m$$, 1, "Car Mass (m)"}, 0.1, 
         10}, {{$CellContext`T$$, 10, "Simulation time (T)"}, 0.1, 100}}, 
      "Options" :> {}, "DefaultOptions" :> {}],
     ImageSizeCache->{403., {217., 223.}},
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

Cell["Static feedback control", "Section", "PluginEmbeddedContent"],

Cell["Controller is a static gain (k) in the feedback loop", "Text", "PluginEmbeddedContent",
 FontSize->16],

Cell[BoxData[
 GraphicsBox[{
   {Hue[0.67, 0.6, 0.6], EdgeForm[{Opacity[1.], AbsoluteThickness[1]}], 
    FaceForm[{Hue[0.08333333333333333, 0.3333333333333333, 1.], Opacity[1.]}],
     DiskBox[{0.2364623940953273, 0.7042959613285512}, \
{0.06117261811944491, 0.05704038671448641}]}, 
   {Hue[0.67, 0.6, 0.6], EdgeForm[{Opacity[1.], AbsoluteThickness[1]}], 
    FaceForm[{Hue[0.08333333333333333, 0.3333333333333333, 1.], Opacity[1.]}],
     RectangleBox[{0.42921929414210735`, 0.7731950725089659}, \
{0.745607879827434, 0.6353968501481363}]}, 
   {Hue[0.67, 0.6, 0.6], EdgeForm[{Opacity[1.], AbsoluteThickness[1]}], 
    FaceForm[{Hue[0.08333333333333333, 0.3333333333333333, 1.], Opacity[1.]}],
     RectangleBox[{0.8631893549560788, 0.7731950725089659}, \
{1.1795779406414055`, 0.6353968501481363}]}, 
   {Hue[0.67, 0.6, 0.6], AbsoluteThickness[1], StrokeForm[{GrayLevel[0.], 
    Opacity[1.]}], EdgeForm[{GrayLevel[0.], Opacity[1.], AbsoluteThickness[
    1]}], FaceForm[{Hue[0.08333333333333333, 0.3333333333333333, 1.], Opacity[
    1.]}], ArrowBox[{{0.3025157232704403, 0.7037735849056603}, {
     0.4270440251572327, 0.7037735849056603}}]}, 
   {Hue[0.67, 0.6, 0.6], AbsoluteThickness[1], StrokeForm[{GrayLevel[0.], 
    Opacity[1.]}], EdgeForm[{GrayLevel[0.], Opacity[1.], AbsoluteThickness[
    1]}], FaceForm[{Hue[0.08333333333333333, 0.3333333333333333, 1.], Opacity[
    1.]}], ArrowBox[{{0.7421383647798743, 0.7003018867924526}, {
     0.8666666666666667, 0.7003018867924526}}]}, 
   {Hue[0.67, 0.6, 0.6], AbsoluteThickness[1], StrokeForm[{GrayLevel[0.], 
    Opacity[1.]}], EdgeForm[{GrayLevel[0.], Opacity[1.], AbsoluteThickness[
    1]}], FaceForm[{Hue[0.08333333333333333, 0.3333333333333333, 1.], Opacity[
    1.]}], ArrowBox[{{1.1761006289308176`, 0.7078490566037734}, {
     1.3006289308176102`, 0.7078490566037734}}]}, 
   {Hue[0.67, 0.6, 0.6], AbsoluteThickness[1], StrokeForm[{GrayLevel[0.], 
    Opacity[1.]}], EdgeForm[{RGBColor[0., 0., 0.], Opacity[1.], 
    AbsoluteThickness[1]}], FaceForm[{Hue[
    0.08333333333333333, 0.3333333333333333, 1.], Opacity[1.]}], 
    ArrowBox[{{0.23081761006289314`, 0.39056603773584897`}, {
     0.23459119496855352`, 0.650943396226415}}]}, 
   {Hue[0.67, 0.6, 0.6], AbsoluteThickness[1], StrokeForm[{GrayLevel[0.], 
    Opacity[1.]}], EdgeForm[{GrayLevel[0.], Opacity[1.]}], EdgeForm[None], 
    LineBox[{{0.23081761006289314`, 0.39433962264150935`}, {
     1.2270440251572328`, 0.39433962264150935`}, {1.2270440251572328`, 
     0.7037735849056603}}]}, 
   {Hue[0.67, 0.6, 0.6], AbsoluteThickness[1], StrokeForm[{GrayLevel[0.], 
    Opacity[1.]}], EdgeForm[{GrayLevel[0.], Opacity[1.], AbsoluteThickness[
    1]}], FaceForm[{Hue[0.08333333333333333, 0.3333333333333333, 1.], Opacity[
    1.]}], ArrowBox[{{0.051572327044025146`, 0.7078490566037734}, {
     0.17610062893081757`, 0.7078490566037734}}]}, InsetBox[
    StyleBox[
     TagBox["u",
      HoldForm],
     TextAlignment->Center,
     FontSize->24,
     Background->GrayLevel[1.]], {0.7742138364779876, 0.7490566037735849}, {
    Left, Baseline},
    Alignment->{Left, Top}], InsetBox[
    StyleBox[
     TagBox["v",
      HoldForm],
     TextAlignment->Center,
     FontSize->24,
     Background->GrayLevel[1.]], {1.2044025157232705`, 0.7490566037735849}, {
    Left, Baseline},
    Alignment->{Left, Top}], InsetBox[
    StyleBox[
     TagBox["e",
      HoldForm],
     TextAlignment->Center,
     FontSize->24,
     Background->GrayLevel[1.]], {0.32515723270440255`, 0.7528301886792452}, {
    Left, Baseline},
    Alignment->{Left, Top}], InsetBox[
    StyleBox[
     TagBox["+",
      HoldForm],
     TextAlignment->Center,
     FontSize->24,
     Background->GrayLevel[1.]], {0.10628930817610066`, 0.6320754716981131}, {
    Left, Baseline},
    Alignment->{Left, Top}], InsetBox[
    StyleBox[
     TagBox["-",
      HoldForm],
     TextAlignment->Center,
     FontSize->24,
     Background->GrayLevel[1.]], {0.26477987421383653`, 0.5528301886792452}, {
    Left, Baseline},
    Alignment->{Left, Top}], InsetBox[
    StyleBox[
     TagBox[
      OverscriptBox["v", "_"],
      HoldForm],
     TextAlignment->Center,
     FontSize->24,
     FontSlant->"Italic",
     Background->GrayLevel[1.]], {0.057232704402515794`, 0.749056603773585}, {
    Left, Baseline},
    Alignment->{Left, Top}], 
   StyleBox[InsetBox[
     StyleBox[
      TagBox["g",
       HoldForm],
      TextAlignment->Center,
      FontSize->24,
      FontSlant->"Italic"], {0.9817610062893083, 0.6886792452830189}, {
     Left, Baseline},
     Alignment->{Left, Top}],
    Background->Hue[0.08333333333333333, 0.3333333333333333, 1.]], 
   StyleBox[InsetBox[
     StyleBox[
      TagBox["k",
       HoldForm],
      TextAlignment->Center,
      FontSize->24,
      FontSlant->"Italic"], {0.559119496855346, 0.6849056603773586}, {
     Left, Baseline},
     Alignment->{Left, Top}],
    Background->Hue[0.08333333333333333, 0.3333333333333333, 1.]]},
  ContentSelectable->True,
  ImagePadding->{{0., 0.}, {0., 0.}},
  ImageSize->{356., 265.},
  PlotRange->{{0., 1.3333333333333335`}, {0., 1.}},
  PlotRangePadding->Automatic]], "Input", "PluginEmbeddedContent",
 Evaluatable->False],

Cell[TextData[{
 "The closed loop response is given by\n\n\t",
 Cell[BoxData[
  RowBox[{
   RowBox[{"V", "[", "s", "]"}], "=", 
   RowBox[{
    RowBox[{"H", "[", "s", "]"}], 
    RowBox[{
     OverscriptBox["V", "_"], "[", "s", "]"}], " "}]}]],
  CellChangeTimes->{3.542558680017943*^9}],
 "\n\nwhere H[s] is the closed loop transfer function\n\n\t",
 Cell[BoxData[
  RowBox[{
   RowBox[{"H", "[", "s", "]"}], "=", 
   FractionBox[
    RowBox[{
     RowBox[{"G", "[", "s", "]"}], " ", "k"}], 
    RowBox[{"1", "+", 
     RowBox[{
      RowBox[{"G", "[", "s", "]"}], " ", "k"}]}]]}]],
  CellChangeTimes->{3.542558680017943*^9}],
 "\n\nWe use ",
 StyleBox["Mathematica",
  FontSlant->"Italic"],
 " to compute H"
}], "Text", "PluginEmbeddedContent",
 FontSize->16],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"H", "=", 
  RowBox[{"Simplify", "[", 
   RowBox[{"G", " ", 
    RowBox[{"k", "/", 
     RowBox[{"(", 
      RowBox[{"1", "+", 
       RowBox[{"G", " ", "k"}]}], ")"}]}]}], "]"}]}]], "Input", \
"PluginEmbeddedContent"],

Cell[BoxData[
 FractionBox[
  RowBox[{"k", " ", "\[Alpha]"}], 
  RowBox[{"s", "+", 
   RowBox[{"k", " ", "\[Alpha]"}], "+", "\[Beta]"}]]], "Output", \
"PluginEmbeddedContent"]
}, Open  ]],

Cell[TextData[{
 "The closed-loop response to a step (denoted 1[t]) of size ",
 Cell[BoxData[
  OverscriptBox["u", "_"]],
  CellChangeTimes->{{3.542558242365675*^9, 3.542558256334731*^9}}],
 " can be shown to be equal to\n\n\t",
 Cell[BoxData[
  RowBox[{
   RowBox[{"v", "[", "t", "]"}], "=", 
   RowBox[{
    FractionBox[
     RowBox[{
      OverscriptBox["u", "_"], "k", " ", "\[Alpha]"}], 
     RowBox[{"\[Beta]", "+", 
      RowBox[{"k", " ", "\[Alpha]"}]}]], 
    RowBox[{"(", 
     RowBox[{"1", "-", 
      SuperscriptBox["E", 
       RowBox[{
        RowBox[{"-", 
         RowBox[{"(", 
          RowBox[{"\[Beta]", "+", 
           RowBox[{"k", " ", "\[Alpha]"}]}], ")"}]}], " ", "t"}]]}], ")"}], 
    RowBox[{"1", "[", "t", "]"}]}]}]],
  CellChangeTimes->{3.542558680017943*^9}],
 "\n\nWe calculate this response using ",
 StyleBox["Mathematica",
  FontSlant->"Italic"]
}], "Text", "PluginEmbeddedContent",
 FontSize->16],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"FullSimplify", "[", 
  RowBox[{"InverseLaplaceTransform", "[", 
   RowBox[{
    RowBox[{"H", 
     RowBox[{
      OverscriptBox["v", "_"], " ", "/", "s"}]}], ",", "s", ",", "t"}], "]"}],
   "]"}]], "Input", "PluginEmbeddedContent"],

Cell[BoxData[
 FractionBox[
  RowBox[{
   RowBox[{"(", 
    RowBox[{"1", "-", 
     SuperscriptBox["\[ExponentialE]", 
      RowBox[{
       RowBox[{"-", "t"}], " ", 
       RowBox[{"(", 
        RowBox[{
         RowBox[{"k", " ", "\[Alpha]"}], "+", "\[Beta]"}], ")"}]}]]}], ")"}], 
   " ", "k", " ", "\[Alpha]", " ", 
   OverscriptBox["v", "_"]}], 
  RowBox[{
   RowBox[{"k", " ", "\[Alpha]"}], "+", "\[Beta]"}]]], "Output", \
"PluginEmbeddedContent"]
}, Open  ]],

Cell["\<\
We explore the value of the response v[t] in the next interactive plot:\
\>", "Text", "PluginEmbeddedContent",
 FontSize->16],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Manipulate", "[", "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Show", "[", "\[IndentingNewLine]", 
    RowBox[{
     RowBox[{"Plot", "[", "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"vBar", ",", 
         RowBox[{"vBar", " ", "k", " ", 
          RowBox[{"kp", "/", 
           RowBox[{"(", 
            RowBox[{"b", "+", 
             RowBox[{"k", " ", "kp"}]}], ")"}]}]}], ",", 
         RowBox[{
          RowBox[{"(", 
           RowBox[{"1", "-", 
            RowBox[{"Exp", "[", 
             RowBox[{
              RowBox[{"-", 
               RowBox[{"(", 
                RowBox[{
                 RowBox[{"(", 
                  RowBox[{"b", "+", 
                   RowBox[{"k", " ", "kp"}]}], ")"}], "/", "m"}], ")"}]}], 
              " ", "t"}], "]"}]}], ")"}], "vBar", " ", "k", " ", 
          RowBox[{"kp", "/", 
           RowBox[{"(", 
            RowBox[{"b", "+", 
             RowBox[{"k", " ", "kp"}]}], ")"}]}]}]}], "}"}], 
       "\[IndentingNewLine]", ",", "\[IndentingNewLine]", 
       RowBox[{"{", 
        RowBox[{"t", ",", "0", ",", "T"}], "}"}], ",", "\[IndentingNewLine]", 
       
       RowBox[{"PlotStyle", "\[Rule]", 
        RowBox[{"{", 
         RowBox[{
          RowBox[{"Directive", "[", 
           RowBox[{"Green", ",", "Dashed"}], "]"}], ",", 
          RowBox[{"Directive", "[", 
           RowBox[{"Red", ",", "Dashed"}], "]"}], ",", "Blue"}], "}"}]}], ",",
        "\[IndentingNewLine]", 
       RowBox[{"PlotRange", "\[Rule]", 
        RowBox[{"{", 
         RowBox[{"0", ",", 
          RowBox[{"1.1", " ", 
           RowBox[{"Max", "[", 
            RowBox[{
             RowBox[{"(", 
              RowBox[{"k", " ", "kp", " ", 
               RowBox[{"vBar", "/", 
                RowBox[{"(", 
                 RowBox[{"b", "+", 
                  RowBox[{"k", " ", "kp"}]}], ")"}]}]}], ")"}], ",", "vBar"}],
             "]"}]}]}], "}"}]}], ",", "\[IndentingNewLine]", 
       RowBox[{"GridLines", "\[Rule]", "Automatic"}], ",", 
       "\[IndentingNewLine]", 
       RowBox[{"Frame", "\[Rule]", "True"}], ",", "\[IndentingNewLine]", 
       RowBox[{"FrameLabel", "\[Rule]", 
        RowBox[{"{", "\[IndentingNewLine]", 
         RowBox[{
          RowBox[{"{", 
           RowBox[{"\"\<v (m/s)\>\"", ",", "\"\<\>\""}], "}"}], ",", 
          "\[IndentingNewLine]", 
          RowBox[{"{", 
           RowBox[{"\"\<t (s)\>\"", ",", 
            RowBox[{"\"\<\!\(\*SubscriptBox[\(k\), \(p\)]\) = \>\"", "<>", 
             RowBox[{"ToString", "[", "kp", "]"}], "<>", "\"\<, b = \>\"", "<>", 
             RowBox[{"ToString", "[", "b", "]"}], "<>", "\"\<, m = \>\"", "<>", 
             RowBox[{"ToString", "[", "m", "]"}], "<>", "\"\<\\tk = \>\"", "<>", 
             RowBox[{"ToString", "[", "k", "]"}], "<>", 
             "\"\<\\t(\[Alpha],\[Beta])=(\>\"", "<>", 
             RowBox[{"ToString", "[", 
              RowBox[{"Round", "[", 
               RowBox[{
                RowBox[{"kp", "/", "m"}], ",", "0.01"}], "]"}], "]"}], "<>", 
             "\"\<,\>\"", "<>", 
             RowBox[{"ToString", "[", 
              RowBox[{"Round", "[", 
               RowBox[{
                RowBox[{"b", "/", "m"}], ",", "0.01"}], "]"}], "]"}], "<>", 
             "\"\<)\>\""}]}], " ", "}"}]}], "\[IndentingNewLine]", "}"}]}]}], 
      "\[IndentingNewLine]", "]"}], ",", "\[IndentingNewLine]", 
     RowBox[{"Graphics", "[", 
      RowBox[{"Text", "[", 
       RowBox[{
       "\"\<\!\(\*OverscriptBox[\(u\), \(_\)]\) \!\(\*SubscriptBox[\(k\), \(p\
\)]\)/b\>\"", ",", 
        RowBox[{"{", 
         RowBox[{
          RowBox[{".9", "T"}], ",", 
          RowBox[{
           RowBox[{"(", 
            RowBox[{"k", " ", "kp", " ", 
             RowBox[{"vBar", "/", 
              RowBox[{"(", 
               RowBox[{"b", "+", 
                RowBox[{"k", " ", "kp"}]}], ")"}]}]}], ")"}], "+", 
           RowBox[{".05", 
            RowBox[{"Max", "[", 
             RowBox[{
              RowBox[{"(", 
               RowBox[{"k", " ", "kp", " ", 
                RowBox[{"vBar", "/", 
                 RowBox[{"(", 
                  RowBox[{"b", "+", 
                   RowBox[{"k", " ", "kp"}]}], ")"}]}]}], ")"}], ",", 
              "vBar"}], "]"}]}]}]}], "}"}]}], "]"}], "]"}], ",", 
     "\[IndentingNewLine]", 
     RowBox[{"Graphics", "[", 
      RowBox[{"Text", "[", 
       RowBox[{"\"\<\!\(\*OverscriptBox[\(u\), \(_\)]\)\>\"", ",", 
        RowBox[{"{", 
         RowBox[{
          RowBox[{".9", "T"}], ",", 
          RowBox[{"vBar", "+", 
           RowBox[{".05", 
            RowBox[{"Max", "[", 
             RowBox[{
              RowBox[{"(", 
               RowBox[{"k", " ", "kp", " ", 
                RowBox[{"vBar", "/", 
                 RowBox[{"(", 
                  RowBox[{"b", "+", 
                   RowBox[{"k", " ", "kp"}]}], ")"}]}]}], ")"}], ",", 
              "vBar"}], "]"}]}]}]}], "}"}]}], "]"}], "]"}]}], 
    "\[IndentingNewLine]", "]"}], "\[IndentingNewLine]", ",", 
   "\[IndentingNewLine]", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
      "vBar", ",", "1", ",", 
       "\"\<Target speed (\!\(\*OverscriptBox[\(v\), \(_\)]\))\>\""}], "}"}], 
     ",", "1", ",", "10"}], "}"}], ",", "\[IndentingNewLine]", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
      "kp", ",", "1", ",", 
       "\"\<Pedal Gain (\!\(\*SubscriptBox[\(k\), \(p\)]\))\>\""}], "}"}], 
     ",", "0", ",", "10"}], "}"}], ",", "\[IndentingNewLine]", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"b", ",", "2", ",", "\"\<Friction coefficient (b)\>\""}], "}"}],
      ",", "0.1", ",", "10"}], "}"}], ",", "\[IndentingNewLine]", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"m", ",", "1", ",", "\"\<Car Mass (m)\>\""}], "}"}], ",", "0.1",
      ",", "10"}], "}"}], ",", "\[IndentingNewLine]", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"k", ",", "1", ",", "\"\<Control Gain (k)\>\""}], "}"}], ",", 
     "0", ",", "100"}], "}"}], ",", "\[IndentingNewLine]", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"T", ",", "10", ",", "\"\<Simulation time (T)\>\""}], "}"}], 
     ",", ".1", ",", "100"}], "}"}]}], "\[IndentingNewLine]", "]"}]], "Input",\
 "PluginEmbeddedContent",
 CellOpen->False],

Cell[BoxData[
 TagBox[
  StyleBox[
   DynamicModuleBox[{$CellContext`b$$ = 2, $CellContext`k$$ = 
    1, $CellContext`kp$$ = 1, $CellContext`m$$ = 1, $CellContext`T$$ = 
    10, $CellContext`vBar$$ = 1, Typeset`show$$ = True, 
    Typeset`bookmarkList$$ = {}, Typeset`bookmarkMode$$ = "Menu", 
    Typeset`animator$$, Typeset`animvar$$ = 1, Typeset`name$$ = 
    "\"untitled\"", Typeset`specs$$ = {{{
       Hold[$CellContext`vBar$$], 1, 
       "Target speed (\!\(\*OverscriptBox[\(v\), \(_\)]\))"}, 1, 10}, {{
       Hold[$CellContext`kp$$], 1, 
       "Pedal Gain (\!\(\*SubscriptBox[\(k\), \(p\)]\))"}, 0, 10}, {{
       Hold[$CellContext`b$$], 2, "Friction coefficient (b)"}, 0.1, 10}, {{
       Hold[$CellContext`m$$], 1, "Car Mass (m)"}, 0.1, 10}, {{
       Hold[$CellContext`k$$], 1, "Control Gain (k)"}, 0, 100}, {{
       Hold[$CellContext`T$$], 10, "Simulation time (T)"}, 0.1, 100}}, 
    Typeset`size$$ = {360., {119., 124.}}, Typeset`update$$ = 0, 
    Typeset`initDone$$, Typeset`skipInitDone$$ = 
    True, $CellContext`vBar$1510$$ = 0, $CellContext`kp$1511$$ = 
    0, $CellContext`b$1512$$ = 0, $CellContext`m$1513$$ = 
    0, $CellContext`k$1514$$ = 0, $CellContext`T$1515$$ = 0}, 
    DynamicBox[Manipulate`ManipulateBoxes[
     1, StandardForm, 
      "Variables" :> {$CellContext`b$$ = 2, $CellContext`k$$ = 
        1, $CellContext`kp$$ = 1, $CellContext`m$$ = 1, $CellContext`T$$ = 
        10, $CellContext`vBar$$ = 1}, "ControllerVariables" :> {
        Hold[$CellContext`vBar$$, $CellContext`vBar$1510$$, 0], 
        Hold[$CellContext`kp$$, $CellContext`kp$1511$$, 0], 
        Hold[$CellContext`b$$, $CellContext`b$1512$$, 0], 
        Hold[$CellContext`m$$, $CellContext`m$1513$$, 0], 
        Hold[$CellContext`k$$, $CellContext`k$1514$$, 0], 
        Hold[$CellContext`T$$, $CellContext`T$1515$$, 0]}, 
      "OtherVariables" :> {
       Typeset`show$$, Typeset`bookmarkList$$, Typeset`bookmarkMode$$, 
        Typeset`animator$$, Typeset`animvar$$, Typeset`name$$, 
        Typeset`specs$$, Typeset`size$$, Typeset`update$$, Typeset`initDone$$,
         Typeset`skipInitDone$$}, "Body" :> Show[
        Plot[{$CellContext`vBar$$, $CellContext`vBar$$ $CellContext`k$$ \
($CellContext`kp$$/($CellContext`b$$ + $CellContext`k$$ $CellContext`kp$$)), (
           1 - Exp[(-(($CellContext`b$$ + $CellContext`k$$ \
$CellContext`kp$$)/$CellContext`m$$)) $CellContext`t]) $CellContext`vBar$$ \
$CellContext`k$$ ($CellContext`kp$$/($CellContext`b$$ + $CellContext`k$$ \
$CellContext`kp$$))}, {$CellContext`t, 0, $CellContext`T$$}, PlotStyle -> {
           Directive[Green, Dashed], 
           Directive[Red, Dashed], Blue}, 
         PlotRange -> {
          0, 1.1 Max[$CellContext`k$$ $CellContext`kp$$ \
($CellContext`vBar$$/($CellContext`b$$ + $CellContext`k$$ \
$CellContext`kp$$)), $CellContext`vBar$$]}, GridLines -> Automatic, Frame -> 
         True, FrameLabel -> {{"v (m/s)", ""}, {"t (s)", 
            StringJoin["\!\(\*SubscriptBox[\(k\), \(p\)]\) = ", 
             ToString[$CellContext`kp$$], ", b = ", 
             ToString[$CellContext`b$$], ", m = ", 
             ToString[$CellContext`m$$], "\tk = ", 
             ToString[$CellContext`k$$], "\t(\[Alpha],\[Beta])=(", 
             ToString[
              Round[$CellContext`kp$$/$CellContext`m$$, 0.01]], ",", 
             ToString[
              Round[$CellContext`b$$/$CellContext`m$$, 0.01]], ")"]}}], 
        Graphics[
         Text[
         "\!\(\*OverscriptBox[\(u\), \(_\)]\) \!\(\*SubscriptBox[\(k\), \
\(p\)]\)/b", {
          0.9 $CellContext`T$$, $CellContext`k$$ $CellContext`kp$$ \
($CellContext`vBar$$/($CellContext`b$$ + $CellContext`k$$ $CellContext`kp$$)) + 
           0.05 Max[$CellContext`k$$ $CellContext`kp$$ \
($CellContext`vBar$$/($CellContext`b$$ + $CellContext`k$$ \
$CellContext`kp$$)), $CellContext`vBar$$]}]], 
        Graphics[
         Text[
         "\!\(\*OverscriptBox[\(u\), \(_\)]\)", {
          0.9 $CellContext`T$$, $CellContext`vBar$$ + 
           0.05 Max[$CellContext`k$$ $CellContext`kp$$ \
($CellContext`vBar$$/($CellContext`b$$ + $CellContext`k$$ \
$CellContext`kp$$)), $CellContext`vBar$$]}]]], 
      "Specifications" :> {{{$CellContext`vBar$$, 1, 
          "Target speed (\!\(\*OverscriptBox[\(v\), \(_\)]\))"}, 1, 
         10}, {{$CellContext`kp$$, 1, 
          "Pedal Gain (\!\(\*SubscriptBox[\(k\), \(p\)]\))"}, 0, 
         10}, {{$CellContext`b$$, 2, "Friction coefficient (b)"}, 0.1, 
         10}, {{$CellContext`m$$, 1, "Car Mass (m)"}, 0.1, 
         10}, {{$CellContext`k$$, 1, "Control Gain (k)"}, 0, 
         100}, {{$CellContext`T$$, 10, "Simulation time (T)"}, 0.1, 100}}, 
      "Options" :> {}, "DefaultOptions" :> {}],
     ImageSizeCache->{403., {231., 237.}},
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

Cell["Integral feedback control", "Section", "PluginEmbeddedContent"],

Cell["Controller is an integrator in the feedback loop", "Text", "PluginEmbeddedContent",
 FontSize->16],

Cell[BoxData[
 GraphicsBox[{
   {Hue[0.67, 0.6, 0.6], EdgeForm[{Opacity[1.], AbsoluteThickness[1]}], 
    FaceForm[{Hue[0.08333333333333333, 0.3333333333333333, 1.], Opacity[1.]}],
     DiskBox[{0.2364623940953273, 0.7042959613285512}, \
{0.06117261811944491, 0.05704038671448641}]}, 
   {Hue[0.67, 0.6, 0.6], EdgeForm[{Opacity[1.], AbsoluteThickness[1]}], 
    FaceForm[{Hue[0.08333333333333333, 0.3333333333333333, 1.], Opacity[1.]}],
     RectangleBox[{0.42921929414210735`, 0.7731950725089659}, \
{0.745607879827434, 0.6353968501481363}]}, 
   {Hue[0.67, 0.6, 0.6], EdgeForm[{Opacity[1.], AbsoluteThickness[1]}], 
    FaceForm[{Hue[0.08333333333333333, 0.3333333333333333, 1.], Opacity[1.]}],
     RectangleBox[{0.8631893549560788, 0.7731950725089659}, \
{1.1795779406414055`, 0.6353968501481363}]}, 
   {Hue[0.67, 0.6, 0.6], AbsoluteThickness[1], StrokeForm[{GrayLevel[0.], 
    Opacity[1.]}], EdgeForm[{GrayLevel[0.], Opacity[1.], AbsoluteThickness[
    1]}], FaceForm[{Hue[0.08333333333333333, 0.3333333333333333, 1.], Opacity[
    1.]}], ArrowBox[{{0.3025157232704403, 0.7037735849056603}, {
     0.4270440251572327, 0.7037735849056603}}]}, 
   {Hue[0.67, 0.6, 0.6], AbsoluteThickness[1], StrokeForm[{GrayLevel[0.], 
    Opacity[1.]}], EdgeForm[{GrayLevel[0.], Opacity[1.], AbsoluteThickness[
    1]}], FaceForm[{Hue[0.08333333333333333, 0.3333333333333333, 1.], Opacity[
    1.]}], ArrowBox[{{0.7421383647798743, 0.7003018867924526}, {
     0.8666666666666667, 0.7003018867924526}}]}, 
   {Hue[0.67, 0.6, 0.6], AbsoluteThickness[1], StrokeForm[{GrayLevel[0.], 
    Opacity[1.]}], EdgeForm[{GrayLevel[0.], Opacity[1.], AbsoluteThickness[
    1]}], FaceForm[{Hue[0.08333333333333333, 0.3333333333333333, 1.], Opacity[
    1.]}], ArrowBox[{{1.1761006289308176`, 0.7078490566037734}, {
     1.3006289308176102`, 0.7078490566037734}}]}, 
   {Hue[0.67, 0.6, 0.6], AbsoluteThickness[1], StrokeForm[{GrayLevel[0.], 
    Opacity[1.]}], EdgeForm[{RGBColor[0., 0., 0.], Opacity[1.], 
    AbsoluteThickness[1]}], FaceForm[{Hue[
    0.08333333333333333, 0.3333333333333333, 1.], Opacity[1.]}], 
    ArrowBox[{{0.23081761006289314`, 0.39056603773584897`}, {
     0.23459119496855352`, 0.650943396226415}}]}, 
   {Hue[0.67, 0.6, 0.6], AbsoluteThickness[1], StrokeForm[{GrayLevel[0.], 
    Opacity[1.]}], EdgeForm[{GrayLevel[0.], Opacity[1.]}], EdgeForm[None], 
    LineBox[{{0.23081761006289314`, 0.39433962264150935`}, {
     1.2270440251572328`, 0.39433962264150935`}, {1.2270440251572328`, 
     0.7037735849056603}}]}, 
   {Hue[0.67, 0.6, 0.6], AbsoluteThickness[1], StrokeForm[{GrayLevel[0.], 
    Opacity[1.]}], EdgeForm[{GrayLevel[0.], Opacity[1.], AbsoluteThickness[
    1]}], FaceForm[{Hue[0.08333333333333333, 0.3333333333333333, 1.], Opacity[
    1.]}], ArrowBox[{{0.051572327044025146`, 0.7078490566037734}, {
     0.17610062893081757`, 0.7078490566037734}}]}, InsetBox[
    StyleBox[
     TagBox["u",
      HoldForm],
     TextAlignment->Center,
     FontSize->24,
     Background->GrayLevel[1.]], {0.7742138364779876, 0.7490566037735849}, {
    Left, Baseline},
    Alignment->{Left, Top}], InsetBox[
    StyleBox[
     TagBox["v",
      HoldForm],
     TextAlignment->Center,
     FontSize->24,
     Background->GrayLevel[1.]], {1.2044025157232705`, 0.7490566037735849}, {
    Left, Baseline},
    Alignment->{Left, Top}], InsetBox[
    StyleBox[
     TagBox["e",
      HoldForm],
     TextAlignment->Center,
     FontSize->24,
     Background->GrayLevel[1.]], {0.32515723270440255`, 0.7528301886792452}, {
    Left, Baseline},
    Alignment->{Left, Top}], InsetBox[
    StyleBox[
     TagBox["+",
      HoldForm],
     TextAlignment->Center,
     FontSize->24,
     Background->GrayLevel[1.]], {0.10628930817610066`, 0.6320754716981131}, {
    Left, Baseline},
    Alignment->{Left, Top}], InsetBox[
    StyleBox[
     TagBox["-",
      HoldForm],
     TextAlignment->Center,
     FontSize->24,
     Background->GrayLevel[1.]], {0.26477987421383653`, 0.5528301886792452}, {
    Left, Baseline},
    Alignment->{Left, Top}], InsetBox[
    StyleBox[
     TagBox[
      OverscriptBox["v", "_"],
      HoldForm],
     TextAlignment->Center,
     FontSize->24,
     FontSlant->"Italic",
     Background->GrayLevel[1.]], {0.057232704402515794`, 0.749056603773585}, {
    Left, Baseline},
    Alignment->{Left, Top}], 
   StyleBox[InsetBox[
     StyleBox[
      TagBox["g",
       HoldForm],
      TextAlignment->Center,
      FontSize->24,
      FontSlant->"Italic"], {0.9817610062893083, 0.6886792452830189}, {
     Left, Baseline},
     Alignment->{Left, Top}],
    Background->Hue[0.08333333333333333, 0.3333333333333333, 1.]], InsetBox[
    StyleBox[
     TagBox["",
      HoldForm],
     TextAlignment->Center,
     FontSize->24,
     FontSlant->"Italic",
     Background->Hue[
      0.08332951857785915, 0.3333333333333333, 
       1.]], {0.5817610062893083, 0.7075471698113209}, {Left, Baseline},
    Alignment->{Left, Top}], 
   StyleBox[InsetBox[
     StyleBox[
      TagBox["\[Integral]",
       HoldForm],
      TextAlignment->Center,
      FontSlant->"Italic",
      Background->Hue[
       0.08332951857785915, 0.3333333333333333, 
        1.]], {0.559119496855346, 0.7000000000000013}, {
     Left, Baseline}, {0.04150943396226415, 0.10188679245283017`}, {{1., 
     0.}, {0., 1.}},
     Alignment->{Left, Top}],
    FontSize->9]},
  ContentSelectable->True,
  ImagePadding->{{0., 0.}, {0., 0.}},
  ImageSize->{356., 265.},
  PlotRange->{{0., 1.3333333333333335`}, {0., 1.}},
  PlotRangePadding->Automatic]], "Input", "PluginEmbeddedContent",
 Evaluatable->False],

Cell[TextData[{
 "The closed loop response is given by\n\n\t",
 Cell[BoxData[
  RowBox[{
   RowBox[{"V", "[", "s", "]"}], "=", 
   RowBox[{
    RowBox[{"H", "[", "s", "]"}], 
    RowBox[{
     OverscriptBox["V", "_"], "[", "s", "]"}], " "}]}]],
  CellChangeTimes->{3.542558680017943*^9}],
 "\n\nwhere H[s] is the closed loop transfer function\n\n\t",
 Cell[BoxData[
  RowBox[{
   RowBox[{"H", "[", "s", "]"}], "=", 
   FractionBox[
    RowBox[{
     RowBox[{"G", "[", "s", "]"}], " ", 
     RowBox[{"K", "[", "s", "]"}]}], 
    RowBox[{"1", "+", 
     RowBox[{
      RowBox[{"G", "[", "s", "]"}], " ", 
      RowBox[{"K", "[", "s", "]"}]}]}]]}]],
  CellChangeTimes->{3.542558680017943*^9}],
 ", \t\twhere\t\t",
 Cell[BoxData[
  RowBox[{
   RowBox[{"K", "[", "s", "]"}], "=", 
   FractionBox["1", "s"]}]],
  CellChangeTimes->{3.542558680017943*^9}],
 "\n\nWe use ",
 StyleBox["Mathematica",
  FontSlant->"Italic"],
 " to compute H"
}], "Text", "PluginEmbeddedContent",
 FontSize->16],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"H", "=", 
  RowBox[{"Simplify", "[", 
   RowBox[{
    RowBox[{"(", 
     RowBox[{"G", " ", 
      RowBox[{"k", "/", 
       RowBox[{"(", 
        RowBox[{"1", "+", 
         RowBox[{"G", " ", "k"}]}], ")"}]}]}], ")"}], "/.", 
    RowBox[{"k", "\[Rule]", 
     RowBox[{"1", "/", "s"}]}]}], "]"}]}]], "Input", "PluginEmbeddedContent"],

Cell[BoxData[
 FractionBox["\[Alpha]", 
  RowBox[{
   SuperscriptBox["s", "2"], "+", "\[Alpha]", "+", 
   RowBox[{"s", " ", "\[Beta]"}]}]]], "Output", "PluginEmbeddedContent"]
}, Open  ]],

Cell["\<\
The closed loop response now depends on the roots of the denominator\
\>", "Text", "PluginEmbeddedContent",
 FontSize->16],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"H", "[", 
  RowBox[{"[", 
   RowBox[{"2", ",", "1"}], "]"}], "]"}]], "Input", "PluginEmbeddedContent"],

Cell[BoxData[
 RowBox[{
  SuperscriptBox["s", "2"], "+", "\[Alpha]", "+", 
  RowBox[{"s", " ", "\[Beta]"}]}]], "Output", "PluginEmbeddedContent"]
}, Open  ]],

Cell["which we can calculate as", "Text", "PluginEmbeddedContent",
 FontSize->16],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Solve", "[", 
  RowBox[{
   RowBox[{
    RowBox[{"H", "[", 
     RowBox[{"[", 
      RowBox[{"2", ",", "1"}], "]"}], "]"}], "\[Equal]", "0"}], ",", "s"}], 
  "]"}]], "Input", "PluginEmbeddedContent"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"s", "\[Rule]", 
     RowBox[{
      FractionBox["1", "2"], " ", 
      RowBox[{"(", 
       RowBox[{
        RowBox[{"-", "\[Beta]"}], "-", 
        SqrtBox[
         RowBox[{
          RowBox[{
           RowBox[{"-", "4"}], " ", "\[Alpha]"}], "+", 
          SuperscriptBox["\[Beta]", "2"]}]]}], ")"}]}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"s", "\[Rule]", 
     RowBox[{
      FractionBox["1", "2"], " ", 
      RowBox[{"(", 
       RowBox[{
        RowBox[{"-", "\[Beta]"}], "+", 
        SqrtBox[
         RowBox[{
          RowBox[{
           RowBox[{"-", "4"}], " ", "\[Alpha]"}], "+", 
          SuperscriptBox["\[Beta]", "2"]}]]}], ")"}]}]}], "}"}]}], 
  "}"}]], "Output", "PluginEmbeddedContent"]
}, Open  ]],

Cell[TextData[{
 "If \t\[Beta]^2 > 4\[Alpha]\tthen the roots are real, and the response is \
the sum of two real exponentials. If not, they are complex, and the response \
involves sines and cosines multiplied by a real exponential. We calculate \
this response using ",
 StyleBox["Mathematica",
  FontSlant->"Italic"]
}], "Text", "PluginEmbeddedContent",
 FontSize->16],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"FullSimplify", "[", 
  RowBox[{"InverseLaplaceTransform", "[", 
   RowBox[{
    RowBox[{"H", " ", 
     RowBox[{
      OverscriptBox["v", "_"], "/", "s"}]}], ",", "s", ",", "t"}], "]"}], 
  "]"}]], "Input", "PluginEmbeddedContent"],

Cell[BoxData[
 RowBox[{"-", 
  FractionBox[
   RowBox[{
    SuperscriptBox["\[ExponentialE]", 
     RowBox[{
      RowBox[{"-", 
       FractionBox["1", "2"]}], " ", "t", " ", 
      RowBox[{"(", 
       RowBox[{"\[Beta]", "+", 
        SqrtBox[
         RowBox[{
          RowBox[{
           RowBox[{"-", "4"}], " ", "\[Alpha]"}], "+", 
          SuperscriptBox["\[Beta]", "2"]}]]}], ")"}]}]], " ", 
    RowBox[{"(", 
     RowBox[{
      RowBox[{
       RowBox[{"(", 
        RowBox[{
         RowBox[{"-", "1"}], "+", 
         SuperscriptBox["\[ExponentialE]", 
          RowBox[{"t", " ", 
           SqrtBox[
            RowBox[{
             RowBox[{
              RowBox[{"-", "4"}], " ", "\[Alpha]"}], "+", 
             SuperscriptBox["\[Beta]", "2"]}]]}]]}], ")"}], " ", "\[Beta]"}], 
      "+", 
      RowBox[{
       RowBox[{"(", 
        RowBox[{"1", "+", 
         SuperscriptBox["\[ExponentialE]", 
          RowBox[{"t", " ", 
           SqrtBox[
            RowBox[{
             RowBox[{
              RowBox[{"-", "4"}], " ", "\[Alpha]"}], "+", 
             SuperscriptBox["\[Beta]", "2"]}]]}]], "-", 
         RowBox[{"2", " ", 
          SuperscriptBox["\[ExponentialE]", 
           RowBox[{
            FractionBox["1", "2"], " ", "t", " ", 
            RowBox[{"(", 
             RowBox[{"\[Beta]", "+", 
              SqrtBox[
               RowBox[{
                RowBox[{
                 RowBox[{"-", "4"}], " ", "\[Alpha]"}], "+", 
                SuperscriptBox["\[Beta]", "2"]}]]}], ")"}]}]]}]}], ")"}], " ", 
       SqrtBox[
        RowBox[{
         RowBox[{
          RowBox[{"-", "4"}], " ", "\[Alpha]"}], "+", 
         SuperscriptBox["\[Beta]", "2"]}]]}]}], ")"}], " ", 
    OverscriptBox["v", "_"]}], 
   RowBox[{"2", " ", 
    SqrtBox[
     RowBox[{
      RowBox[{
       RowBox[{"-", "4"}], " ", "\[Alpha]"}], "+", 
      SuperscriptBox["\[Beta]", "2"]}]]}]]}]], "Output", \
"PluginEmbeddedContent"]
}, Open  ]],

Cell["We explore the response v[t] in the next interactive plot:", "Text", "PluginEmbeddedContent",
 FontSize->16],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Manipulate", "[", "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{"alpha", "=", " ", 
     RowBox[{"kp", "/", "m"}]}], ";", "\[IndentingNewLine]", 
    RowBox[{"beta", "=", " ", 
     RowBox[{"b", "/", "m"}]}], ";", "\[IndentingNewLine]", 
    RowBox[{"wn", "=", 
     RowBox[{"Sqrt", "[", "alpha", "]"}]}], ";", "\[IndentingNewLine]", 
    RowBox[{"xi", "=", 
     RowBox[{"beta", "/", 
      RowBox[{"(", 
       RowBox[{"2", "wn"}], ")"}]}]}], ";", "\[IndentingNewLine]", 
    RowBox[{"M", "=", 
     RowBox[{"If", "[", 
      RowBox[{
       RowBox[{"0", "<", "xi", "<", "1"}], ",", 
       RowBox[{"Exp", "[", 
        RowBox[{
         RowBox[{"-", "xi"}], " ", 
         RowBox[{"Pi", "/", 
          RowBox[{"Sqrt", "[", 
           RowBox[{"1", "-", 
            RowBox[{"xi", "^", "2"}]}], "]"}]}]}], "]"}], ",", "0"}], "]"}]}],
     ";", "\[IndentingNewLine]", 
    RowBox[{"Show", "[", "\[IndentingNewLine]", 
     RowBox[{
      RowBox[{"Plot", "[", "\[IndentingNewLine]", 
       RowBox[{
        RowBox[{"{", 
         RowBox[{"vBar", ",", 
          RowBox[{
           RowBox[{"-", 
            RowBox[{"(", 
             RowBox[{
              RowBox[{"(", 
               RowBox[{
                RowBox[{"beta", "*", 
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{"-", "1"}], "+", 
                   RowBox[{"E", "^", 
                    RowBox[{"(", 
                    RowBox[{
                    RowBox[{"Sqrt", "[", 
                    RowBox[{
                    RowBox[{
                    RowBox[{"-", "4"}], "*", "alpha"}], "+", 
                    RowBox[{"beta", "^", "2"}]}], "]"}], "*", "t"}], 
                    ")"}]}]}], ")"}]}], "+", 
                RowBox[{
                 RowBox[{"Sqrt", "[", 
                  RowBox[{
                   RowBox[{
                    RowBox[{"-", "4"}], "*", "alpha"}], "+", 
                   RowBox[{"beta", "^", "2"}]}], "]"}], "*", 
                 RowBox[{"(", 
                  RowBox[{"1", "+", 
                   RowBox[{"E", "^", 
                    RowBox[{"(", 
                    RowBox[{
                    RowBox[{"Sqrt", "[", 
                    RowBox[{
                    RowBox[{
                    RowBox[{"-", "4"}], "*", "alpha"}], "+", 
                    RowBox[{"beta", "^", "2"}]}], "]"}], "*", "t"}], ")"}]}], 
                   "-", 
                   RowBox[{"2", "*", 
                    RowBox[{"E", "^", 
                    RowBox[{"(", 
                    RowBox[{
                    RowBox[{"(", 
                    RowBox[{
                    RowBox[{"(", 
                    RowBox[{"beta", "+", 
                    RowBox[{"Sqrt", "[", 
                    RowBox[{
                    RowBox[{
                    RowBox[{"-", "4"}], "*", "alpha"}], "+", 
                    RowBox[{"beta", "^", "2"}]}], "]"}]}], ")"}], "*", "t"}], 
                    ")"}], "/", "2"}], ")"}]}]}]}], ")"}]}]}], ")"}], "*", 
              "vBar"}], ")"}]}], "/", 
           RowBox[{"(", 
            RowBox[{"2", "*", 
             RowBox[{"Sqrt", "[", 
              RowBox[{
               RowBox[{
                RowBox[{"-", "4"}], "*", "alpha"}], "+", 
               RowBox[{"beta", "^", "2"}]}], "]"}], "*", 
             RowBox[{"E", "^", 
              RowBox[{"(", 
               RowBox[{
                RowBox[{"(", 
                 RowBox[{
                  RowBox[{"(", 
                   RowBox[{"beta", "+", 
                    RowBox[{"Sqrt", "[", 
                    RowBox[{
                    RowBox[{
                    RowBox[{"-", "4"}], "*", "alpha"}], "+", 
                    RowBox[{"beta", "^", "2"}]}], "]"}]}], ")"}], "*", "t"}], 
                 ")"}], "/", "2"}], ")"}]}]}], ")"}]}]}], "}"}], 
        "\[IndentingNewLine]", ",", "\[IndentingNewLine]", 
        RowBox[{"{", 
         RowBox[{"t", ",", "0", ",", "T"}], "}"}], ",", "\[IndentingNewLine]", 
        RowBox[{"PlotStyle", "\[Rule]", 
         RowBox[{"{", 
          RowBox[{
           RowBox[{"Directive", "[", 
            RowBox[{"Red", ",", "Dashed"}], "]"}], ",", "Blue"}], "}"}]}], 
        ",", "\[IndentingNewLine]", 
        RowBox[{"PlotRange", "\[Rule]", 
         RowBox[{"{", 
          RowBox[{"0", ",", 
           RowBox[{"1.1", "vBar", " ", 
            RowBox[{"(", 
             RowBox[{"1", "+", "M"}], ")"}]}]}], "}"}]}], ",", 
        "\[IndentingNewLine]", 
        RowBox[{"GridLines", "\[Rule]", "Automatic"}], ",", 
        "\[IndentingNewLine]", 
        RowBox[{"Frame", "\[Rule]", "True"}], ",", "\[IndentingNewLine]", 
        RowBox[{"FrameLabel", "\[Rule]", 
         RowBox[{"{", "\[IndentingNewLine]", 
          RowBox[{
           RowBox[{"{", 
            RowBox[{"\"\<v (m/s)\>\"", ",", "\"\<\>\""}], "}"}], ",", 
           "\[IndentingNewLine]", 
           RowBox[{"{", 
            RowBox[{"\"\<t (s)\>\"", ",", 
             RowBox[{"\"\<\!\(\*SubscriptBox[\(k\), \(p\)]\) = \>\"", "<>", 
              RowBox[{"ToString", "[", "kp", "]"}], "<>", "\"\<, b = \>\"", "<>", 
              RowBox[{"ToString", "[", "b", "]"}], "<>", "\"\<, m = \>\"", "<>", 
              RowBox[{"ToString", "[", "m", "]"}], "<>", 
              "\"\<\\t(\[Alpha],\[Beta])=(\>\"", "<>", 
              RowBox[{"ToString", "[", 
               RowBox[{"Round", "[", 
                RowBox[{
                 RowBox[{"kp", "/", "m"}], ",", "0.01"}], "]"}], "]"}], "<>", 
              "\"\<,\>\"", "<>", 
              RowBox[{"ToString", "[", 
               RowBox[{"Round", "[", 
                RowBox[{
                 RowBox[{"b", "/", "m"}], ",", "0.01"}], "]"}], "]"}], "<>", 
              "\"\<)\>\""}]}], " ", "}"}]}], "\[IndentingNewLine]", "}"}]}]}],
        "\[IndentingNewLine]", "]"}], ",", "\[IndentingNewLine]", 
      RowBox[{"Graphics", "[", 
       RowBox[{"Text", "[", 
        RowBox[{"\"\<\!\(\*OverscriptBox[\(v\), \(_\)]\)\>\"", ",", 
         RowBox[{"{", 
          RowBox[{
           RowBox[{".9", "T"}], ",", 
           RowBox[{"vBar", "+", 
            RowBox[{".05", 
             RowBox[{"Max", "[", "vBar", "]"}]}]}]}], "}"}]}], "]"}], "]"}]}],
      "\[IndentingNewLine]", "]"}]}], "\[IndentingNewLine]", ",", 
   "\[IndentingNewLine]", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
      "vBar", ",", "1", ",", 
       "\"\<Target speed (\!\(\*OverscriptBox[\(v\), \(_\)]\))\>\""}], "}"}], 
     ",", "1", ",", "10"}], "}"}], ",", "\[IndentingNewLine]", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
      "kp", ",", "1", ",", 
       "\"\<Pedal Gain (\!\(\*SubscriptBox[\(k\), \(p\)]\))\>\""}], "}"}], 
     ",", "0.01", ",", "10"}], "}"}], ",", "\[IndentingNewLine]", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"b", ",", "1", ",", "\"\<Friction coefficient (b)\>\""}], "}"}],
      ",", "0.1", ",", "10"}], "}"}], ",", "\[IndentingNewLine]", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"m", ",", "1", ",", "\"\<Car Mass (m)\>\""}], "}"}], ",", "0.1",
      ",", "10"}], "}"}], ",", "\[IndentingNewLine]", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"T", ",", "10", ",", "\"\<Simulation time (T)\>\""}], "}"}], 
     ",", ".1", ",", "100"}], "}"}]}], "\[IndentingNewLine]", "]"}]], "Input",\
 "PluginEmbeddedContent",
 CellOpen->False],

Cell[BoxData[
 TagBox[
  StyleBox[
   DynamicModuleBox[{$CellContext`b$$ = 1, $CellContext`kp$$ = 
    1, $CellContext`m$$ = 1, $CellContext`T$$ = 10, $CellContext`vBar$$ = 1, 
    Typeset`show$$ = True, Typeset`bookmarkList$$ = {}, 
    Typeset`bookmarkMode$$ = "Menu", Typeset`animator$$, Typeset`animvar$$ = 
    1, Typeset`name$$ = "\"untitled\"", Typeset`specs$$ = {{{
       Hold[$CellContext`vBar$$], 1, 
       "Target speed (\!\(\*OverscriptBox[\(v\), \(_\)]\))"}, 1, 10}, {{
       Hold[$CellContext`kp$$], 1, 
       "Pedal Gain (\!\(\*SubscriptBox[\(k\), \(p\)]\))"}, 0.01, 10}, {{
       Hold[$CellContext`b$$], 1, "Friction coefficient (b)"}, 0.1, 10}, {{
       Hold[$CellContext`m$$], 1, "Car Mass (m)"}, 0.1, 10}, {{
       Hold[$CellContext`T$$], 10, "Simulation time (T)"}, 0.1, 100}}, 
    Typeset`size$$ = {360., {119., 124.}}, Typeset`update$$ = 0, 
    Typeset`initDone$$, Typeset`skipInitDone$$ = 
    True, $CellContext`vBar$2216$$ = 0, $CellContext`kp$2217$$ = 
    0, $CellContext`b$2218$$ = 0, $CellContext`m$2219$$ = 
    0, $CellContext`T$2220$$ = 0}, 
    DynamicBox[Manipulate`ManipulateBoxes[
     1, StandardForm, 
      "Variables" :> {$CellContext`b$$ = 1, $CellContext`kp$$ = 
        1, $CellContext`m$$ = 1, $CellContext`T$$ = 10, $CellContext`vBar$$ = 
        1}, "ControllerVariables" :> {
        Hold[$CellContext`vBar$$, $CellContext`vBar$2216$$, 0], 
        Hold[$CellContext`kp$$, $CellContext`kp$2217$$, 0], 
        Hold[$CellContext`b$$, $CellContext`b$2218$$, 0], 
        Hold[$CellContext`m$$, $CellContext`m$2219$$, 0], 
        Hold[$CellContext`T$$, $CellContext`T$2220$$, 0]}, 
      "OtherVariables" :> {
       Typeset`show$$, Typeset`bookmarkList$$, Typeset`bookmarkMode$$, 
        Typeset`animator$$, Typeset`animvar$$, Typeset`name$$, 
        Typeset`specs$$, Typeset`size$$, Typeset`update$$, Typeset`initDone$$,
         Typeset`skipInitDone$$}, 
      "Body" :> ($CellContext`alpha = $CellContext`kp$$/$CellContext`m$$; \
$CellContext`beta = $CellContext`b$$/$CellContext`m$$; $CellContext`wn = 
        Sqrt[$CellContext`alpha]; $CellContext`xi = $CellContext`beta/(
         2 $CellContext`wn); $CellContext`M = If[0 < $CellContext`xi < 1, 
          Exp[(-$CellContext`xi) (Pi/Sqrt[1 - $CellContext`xi^2])], 0]; Show[
         Plot[{$CellContext`vBar$$, (-(($CellContext`beta (-1 + 
                E^(Sqrt[(-4) $CellContext`alpha + $CellContext`beta^2] \
$CellContext`t)) + 
              Sqrt[(-4) $CellContext`alpha + $CellContext`beta^2] (1 + 
                E^(Sqrt[(-4) $CellContext`alpha + $CellContext`beta^2] \
$CellContext`t) - 2 
                E^((($CellContext`beta + 
                    Sqrt[(-4) $CellContext`alpha + $CellContext`beta^2]) \
$CellContext`t)/2))) $CellContext`vBar$$))/(2 
           Sqrt[(-4) $CellContext`alpha + $CellContext`beta^2] 
           E^((($CellContext`beta + 
               Sqrt[(-4) $CellContext`alpha + $CellContext`beta^2]) \
$CellContext`t)/2))}, {$CellContext`t, 0, $CellContext`T$$}, PlotStyle -> {
            Directive[Red, Dashed], Blue}, 
          PlotRange -> {0, 1.1 $CellContext`vBar$$ (1 + $CellContext`M)}, 
          GridLines -> Automatic, Frame -> True, 
          FrameLabel -> {{"v (m/s)", ""}, {"t (s)", 
             StringJoin["\!\(\*SubscriptBox[\(k\), \(p\)]\) = ", 
              ToString[$CellContext`kp$$], ", b = ", 
              ToString[$CellContext`b$$], ", m = ", 
              ToString[$CellContext`m$$], "\t(\[Alpha],\[Beta])=(", 
              ToString[
               Round[$CellContext`kp$$/$CellContext`m$$, 0.01]], ",", 
              ToString[
               Round[$CellContext`b$$/$CellContext`m$$, 0.01]], ")"]}}], 
         Graphics[
          Text[
          "\!\(\*OverscriptBox[\(v\), \(_\)]\)", {
           0.9 $CellContext`T$$, $CellContext`vBar$$ + 
            0.05 Max[$CellContext`vBar$$]}]]]), 
      "Specifications" :> {{{$CellContext`vBar$$, 1, 
          "Target speed (\!\(\*OverscriptBox[\(v\), \(_\)]\))"}, 1, 
         10}, {{$CellContext`kp$$, 1, 
          "Pedal Gain (\!\(\*SubscriptBox[\(k\), \(p\)]\))"}, 0.01, 
         10}, {{$CellContext`b$$, 1, "Friction coefficient (b)"}, 0.1, 
         10}, {{$CellContext`m$$, 1, "Car Mass (m)"}, 0.1, 
         10}, {{$CellContext`T$$, 10, "Simulation time (T)"}, 0.1, 100}}, 
      "Options" :> {}, "DefaultOptions" :> {}],
     ImageSizeCache->{403., {217., 223.}},
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
},
WindowSize->{720.8166666666667, 5343.620000000001},
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
Cell[1257, 32, 59, 0, 36, "Title"],
Cell[1319, 34, 57, 0, 16, "Subsubtitle"],
Cell[1379, 36, 68, 0, 16, "Subsubtitle"],
Cell[CellGroupData[{
Cell[1472, 40, 49, 0, 25, "Section"],
Cell[1524, 42, 2110, 62, 632, "Text"]
}, Open  ]],
Cell[CellGroupData[{
Cell[3671, 109, 62, 0, 25, "Section"],
Cell[3736, 111, 148, 4, 16, "Text"],
Cell[CellGroupData[{
Cell[3909, 119, 199, 6, 12, "Input"],
Cell[4111, 127, 109, 2, 31, "Output"]
}, Open  ]],
Cell[4235, 132, 759, 24, 102, "Text"],
Cell[CellGroupData[{
Cell[5019, 160, 535, 16, 28, "Input"],
Cell[5557, 178, 289, 8, 38, "Output"]
}, Open  ]],
Cell[5861, 189, 114, 1, 16, "Text"],
Cell[CellGroupData[{
Cell[6000, 194, 5223, 134, 19, "Input",
 CellOpen->False],
Cell[11226, 330, 4393, 85, 442, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[15668, 421, 67, 0, 25, "Section"],
Cell[15738, 423, 108, 1, 16, "Text"],
Cell[15849, 426, 5180, 120, 265, "Input",
 Evaluatable->False],
Cell[21032, 548, 761, 26, 182, "Text"],
Cell[CellGroupData[{
Cell[21818, 578, 241, 8, 12, "Input"],
Cell[22062, 588, 175, 5, 33, "Output"]
}, Open  ]],
Cell[22252, 596, 931, 29, 102, "Text"],
Cell[CellGroupData[{
Cell[23208, 629, 255, 7, 12, "Input"],
Cell[23466, 638, 453, 15, 38, "Output"]
}, Open  ]],
Cell[23934, 656, 135, 3, 16, "Text"],
Cell[CellGroupData[{
Cell[24094, 663, 6344, 163, 19, "Input",
 CellOpen->False],
Cell[30441, 828, 5078, 94, 470, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[35568, 928, 69, 0, 25, "Section"],
Cell[35640, 930, 104, 1, 16, "Text"],
Cell[35747, 933, 5581, 133, 265, "Input",
 Evaluatable->False],
Cell[41331, 1068, 982, 34, 182, "Text"],
Cell[CellGroupData[{
Cell[42338, 1106, 356, 11, 12, "Input"],
Cell[42697, 1119, 175, 4, 32, "Output"]
}, Open  ]],
Cell[42887, 1126, 132, 3, 16, "Text"],
Cell[CellGroupData[{
Cell[43044, 1133, 126, 3, 12, "Input"],
Cell[43173, 1138, 145, 3, 15, "Output"]
}, Open  ]],
Cell[43333, 1144, 81, 1, 16, "Text"],
Cell[CellGroupData[{
Cell[43439, 1149, 223, 7, 12, "Input"],
Cell[43665, 1158, 785, 27, 31, "Output"]
}, Open  ]],
Cell[44465, 1188, 370, 8, 54, "Text"],
Cell[CellGroupData[{
Cell[44860, 1200, 255, 7, 12, "Input"],
Cell[45118, 1209, 1943, 62, 70, "Output"]
}, Open  ]],
Cell[47076, 1274, 114, 1, 16, "Text"],
Cell[CellGroupData[{
Cell[47215, 1279, 7408, 187, 19, "Input",
 CellOpen->False],
Cell[54626, 1468, 4743, 87, 442, "Output"]
}, Open  ]]
}, Open  ]]
}, Open  ]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature rv0ZWt7qPOJD2DK1OLhMNNJl *)
