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
NotebookDataLength[     28260,        770]
NotebookOptionsPosition[     27310,        718]
NotebookOutlinePosition[     27823,        740]
CellTagsIndexPosition[     27780,        737]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{

Cell[CellGroupData[{
Cell["Cruise Control I", "Title", "PluginEmbeddedContent"],

Cell["MAE 143 B", "Subsubtitle", "PluginEmbeddedContent"],

Cell["Mauricio de Oliveira", "Subsubtitle", "PluginEmbeddedContent"],

Cell[CellGroupData[{

Cell["Model", "Section", "PluginEmbeddedContent"],

Cell[TextData[{
 "Car is represented by the simple static model :\n\n  v = g u\n  \nwhere\n\n \
 v: car speed\n  u: gas pedal excursion\n  \nThe gain \[OpenCurlyQuote]g\
\[CloseCurlyQuote] will have the proper units to convert from pedal excursion \
to car speed.\n\nOur goal is to drive the car to a given speed ",
 Cell[BoxData[
  OverscriptBox["v", "_"]],
  CellChangeTimes->{{3.542558242365675*^9, 3.542558256334731*^9}}],
 " using feedback control.\n\nCheck out other notebooks for more \
sophisticated models later. Note that for better formating we use ",
 StyleBox["Mathematica",
  FontSlant->"Italic"],
 "\[CloseCurlyQuote]s functional notation with brackets instead of the more \
standard parenthesis."
}], "Text", "PluginEmbeddedContent",
 FontSize->16]
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
  RowBox[{"v", "=", 
   RowBox[{"h", " ", 
    OverscriptBox["v", "_"], " "}]}]],
  CellChangeTimes->{3.542558680017943*^9}],
 "\n\nwhere h is the closed loop transfer function\n\n\t",
 Cell[BoxData[
  RowBox[{"h", "=", 
   FractionBox[
    RowBox[{"g", " ", "k"}], 
    RowBox[{"1", "+", 
     RowBox[{"g", " ", "k"}]}]]}]],
  CellChangeTimes->{3.542558680017943*^9}],
 "\n\nNote that because the plant and controller are both static then h is \
also static.\n\nWe explore the value of the function h in the next \
interactive plot:"
}], "Text", "PluginEmbeddedContent",
 FontSize->16],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Manipulate", "[", "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"LogLinearPlot", "[", 
    RowBox[{
     RowBox[{"g", " ", 
      RowBox[{"k", "/", 
       RowBox[{"(", 
        RowBox[{"1", "+", 
         RowBox[{"g", " ", "k"}]}], ")"}]}]}], ",", 
     RowBox[{"{", 
      RowBox[{"k", ",", ".1", ",", "100"}], "}"}], ",", "\[IndentingNewLine]", 
     RowBox[{"PlotRange", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{"0", ",", "1"}], "}"}]}], ",", "\[IndentingNewLine]", 
     RowBox[{"GridLines", "\[Rule]", "Automatic"}], ",", 
     "\[IndentingNewLine]", 
     RowBox[{"Frame", "\[Rule]", "True"}], ",", "\[IndentingNewLine]", 
     RowBox[{"FrameLabel", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"{", 
         RowBox[{
          RowBox[{"k", " ", 
           RowBox[{"g", "/", 
            RowBox[{"(", 
             RowBox[{"1", " ", "+", 
              RowBox[{"k", " ", "g"}]}], ")"}]}]}], ",", "\"\<\>\""}], "}"}], 
        ",", 
        RowBox[{"{", 
         RowBox[{"\"\<k\>\"", ",", 
          RowBox[{"\"\<g = \>\"", "<>", 
           RowBox[{"ToString", "[", "g", "]"}]}]}], "}"}]}], "}"}]}]}], "]"}],
    "\[IndentingNewLine]", ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"g", ",", "1", ",", "\"\<Car Gain (g)\>\""}], "}"}], ",", ".1", 
     ",", "10"}], "}"}]}], "]"}]], "Input", "PluginEmbeddedContent",
 CellOpen->False],

Cell[BoxData[
 TagBox[
  StyleBox[
   DynamicModuleBox[{$CellContext`g$$ = 1, Typeset`show$$ = True, 
    Typeset`bookmarkList$$ = {}, Typeset`bookmarkMode$$ = "Menu", 
    Typeset`animator$$, Typeset`animvar$$ = 1, Typeset`name$$ = 
    "\"untitled\"", Typeset`specs$$ = {{{
       Hold[$CellContext`g$$], 1, "Car Gain (g)"}, 0.1, 10}}, 
    Typeset`size$$ = {360., {115., 119.}}, Typeset`update$$ = 0, 
    Typeset`initDone$$, Typeset`skipInitDone$$ = True, $CellContext`g$101$$ = 
    0}, 
    DynamicBox[Manipulate`ManipulateBoxes[
     1, StandardForm, "Variables" :> {$CellContext`g$$ = 1}, 
      "ControllerVariables" :> {
        Hold[$CellContext`g$$, $CellContext`g$101$$, 0]}, 
      "OtherVariables" :> {
       Typeset`show$$, Typeset`bookmarkList$$, Typeset`bookmarkMode$$, 
        Typeset`animator$$, Typeset`animvar$$, Typeset`name$$, 
        Typeset`specs$$, Typeset`size$$, Typeset`update$$, Typeset`initDone$$,
         Typeset`skipInitDone$$}, "Body" :> 
      LogLinearPlot[$CellContext`g$$ ($CellContext`k/(
         1 + $CellContext`g$$ $CellContext`k)), {$CellContext`k, 0.1, 100}, 
        PlotRange -> {0, 1}, GridLines -> Automatic, Frame -> True, 
        FrameLabel -> {{$CellContext`k ($CellContext`g$$/(
            1 + $CellContext`k $CellContext`g$$)), ""}, {"k", 
           StringJoin["g = ", 
            ToString[$CellContext`g$$]]}}], 
      "Specifications" :> {{{$CellContext`g$$, 1, "Car Gain (g)"}, 0.1, 10}}, 
      "Options" :> {}, "DefaultOptions" :> {}],
     ImageSizeCache->{403., {157., 163.}},
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
 "The closed loop response is now dynamic and is given by\n\n\t",
 Cell[BoxData[
  RowBox[{
   RowBox[{"V", "[", "s", "]"}], "=", 
   RowBox[{
    RowBox[{"H", "[", "s", "]"}], 
    RowBox[{
     OverscriptBox["V", "_"], "[", "s", "]"}], " "}]}]],
  CellChangeTimes->{3.542558680017943*^9}],
 "\n\nafter using the Laplace Transform. H(s) is the closed loop transfer \
function\n\n\t",
 Cell[BoxData[
  RowBox[{
   RowBox[{"H", "[", "s", "]"}], "=", 
   FractionBox[
    RowBox[{"g", " ", 
     RowBox[{"K", "[", "s", "]"}]}], 
    RowBox[{"1", "+", 
     RowBox[{"g", " ", 
      RowBox[{"K", "[", "s", "]"}]}]}]]}]],
  CellChangeTimes->{3.542558680017943*^9}],
 ",\twhere\t\t",
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
    RowBox[{"g", " ", 
     RowBox[{"k", "/", 
      RowBox[{"(", 
       RowBox[{"1", "+", 
        RowBox[{"g", " ", "k"}]}], ")"}]}]}], "/.", 
    RowBox[{"k", "\[Rule]", 
     RowBox[{"1", "/", "s"}]}]}], "]"}]}]], "Input", "PluginEmbeddedContent"],

Cell[BoxData[
 FractionBox["g", 
  RowBox[{"g", "+", "s"}]]], "Output", "PluginEmbeddedContent"]
}, Open  ]],

Cell[TextData[{
 "The closed-loop response to a step (denoted 1[t]) of size ",
 Cell[BoxData[
  OverscriptBox["v", "_"]],
  CellChangeTimes->{{3.542558242365675*^9, 3.542558256334731*^9}}],
 " can be shown to be equal to\n\n\t",
 Cell[BoxData[
  RowBox[{
   RowBox[{"v", "[", "t", "]"}], "=", 
   RowBox[{
    RowBox[{"(", 
     RowBox[{
      OverscriptBox["v", "_"], "+", 
      RowBox[{
       RowBox[{"(", 
        RowBox[{
         RowBox[{"v", "[", "0", "]"}], "-", 
         OverscriptBox["v", "_"]}], ")"}], 
       SuperscriptBox["E", 
        RowBox[{
         RowBox[{"-", "g"}], " ", "t"}]]}]}], ")"}], 
    RowBox[{"1", "[", "t", "]"}]}]}]],
  CellChangeTimes->{3.542558680017943*^9}],
 "\n\nWe can calculate this response using ",
 StyleBox["Mathematica",
  FontSlant->"Italic"],
 " as well"
}], "Text", "PluginEmbeddedContent",
 FontSize->16],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{"Clear", "[", "v", "]"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"v", "[", "t_", "]"}], "=", 
  RowBox[{"FullSimplify", "[", 
   RowBox[{"InverseLaplaceTransform", "[", 
    RowBox[{
     RowBox[{"H", 
      RowBox[{"(", 
       RowBox[{
        RowBox[{
         OverscriptBox["v", "_"], " ", "/", "s"}], "+", 
        RowBox[{"v0", "/", "g"}]}], ")"}]}], ",", "s", ",", "t"}], "]"}], 
   "]"}]}]}], "Input", "PluginEmbeddedContent"],

Cell[BoxData[
 RowBox[{
  RowBox[{
   SuperscriptBox["\[ExponentialE]", 
    RowBox[{
     RowBox[{"-", "g"}], " ", "t"}]], " ", 
   RowBox[{"(", 
    RowBox[{"v0", "-", 
     OverscriptBox["v", "_"]}], ")"}]}], "+", 
  OverscriptBox["v", "_"]}]], "Output", "PluginEmbeddedContent"]
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
        RowBox[{"v0", ",", "vBar", ",", 
         RowBox[{"vBar", "+", 
          RowBox[{
           RowBox[{"(", 
            RowBox[{"v0", "-", "vBar"}], ")"}], 
           RowBox[{"Exp", "[", 
            RowBox[{
             RowBox[{"-", "g"}], " ", "t"}], "]"}]}]}]}], "}"}], 
       "\[IndentingNewLine]", ",", "\[IndentingNewLine]", 
       RowBox[{"{", 
        RowBox[{"t", ",", "0", ",", "10"}], "}"}], ",", "\[IndentingNewLine]", 
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
          RowBox[{"1.1", 
           RowBox[{"Max", "[", 
            RowBox[{"vBar", ",", "v0"}], "]"}]}]}], "}"}]}], ",", 
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
            RowBox[{"\"\<g = \>\"", "<>", 
             RowBox[{"ToString", "[", "g", "]"}]}]}], "}"}]}], 
         "\[IndentingNewLine]", "}"}]}]}], "\[IndentingNewLine]", "]"}], ",", 
     "\[IndentingNewLine]", 
     RowBox[{"Graphics", "[", 
      RowBox[{"Text", "[", 
       RowBox[{"\"\<\!\(\*OverscriptBox[\(v\), \(_\)]\)\>\"", ",", 
        RowBox[{"{", 
         RowBox[{"9", ",", 
          RowBox[{"vBar", "+", 
           RowBox[{".05", 
            RowBox[{"Max", "[", 
             RowBox[{"vBar", ",", "v0"}], "]"}]}]}]}], "}"}]}], "]"}], "]"}], 
     ",", "\[IndentingNewLine]", 
     RowBox[{"Graphics", "[", 
      RowBox[{"Text", "[", 
       RowBox[{"\"\<v[0]\>\"", ",", 
        RowBox[{"{", 
         RowBox[{"9", ",", 
          RowBox[{"v0", "+", 
           RowBox[{".05", 
            RowBox[{"Max", "[", 
             RowBox[{"vBar", ",", "v0"}], "]"}]}]}]}], " ", "}"}]}], "]"}], 
      "]"}]}], "\[IndentingNewLine]", "]"}], "\[IndentingNewLine]", ",", 
   "\[IndentingNewLine]", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
      "vBar", ",", "1", ",", 
       "\"\<Target Velocity (\!\(\*OverscriptBox[\(v\), \(_\)]\))\>\""}], 
      "}"}], ",", "1", ",", "10"}], "}"}], ",", "\[IndentingNewLine]", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"v0", ",", "0", ",", "\"\<Initial Velocity (v0)\>\""}], "}"}], 
     ",", "0", ",", 
     RowBox[{"2", "vBar"}]}], "}"}], ",", "\[IndentingNewLine]", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"g", ",", "1", ",", "\"\<Car Gain (g)\>\""}], "}"}], ",", ".1", 
     ",", "10"}], "}"}]}], "\[IndentingNewLine]", "]"}]], "Input", \
"PluginEmbeddedContent",
 CellOpen->False],

Cell[BoxData[
 TagBox[
  StyleBox[
   DynamicModuleBox[{$CellContext`g$$ = 1, $CellContext`v0$$ = 
    0, $CellContext`vBar$$ = 1, Typeset`show$$ = True, 
    Typeset`bookmarkList$$ = {}, Typeset`bookmarkMode$$ = "Menu", 
    Typeset`animator$$, Typeset`animvar$$ = 1, Typeset`name$$ = 
    "\"untitled\"", Typeset`specs$$ = {{{
       Hold[$CellContext`vBar$$], 1, 
       "Target Velocity (\!\(\*OverscriptBox[\(v\), \(_\)]\))"}, 1, 10}, {{
       Hold[$CellContext`v0$$], 0, "Initial Velocity (v0)"}, 0, 
      Dynamic[2 $CellContext`vBar$$]}, {{
       Hold[$CellContext`g$$], 1, "Car Gain (g)"}, 0.1, 10}}, 
    Typeset`size$$ = {360., {119., 123.}}, Typeset`update$$ = 0, 
    Typeset`initDone$$, Typeset`skipInitDone$$ = 
    True, $CellContext`vBar$525$$ = 0, $CellContext`v0$526$$ = 
    0, $CellContext`g$527$$ = 0}, 
    DynamicBox[Manipulate`ManipulateBoxes[
     1, StandardForm, 
      "Variables" :> {$CellContext`g$$ = 1, $CellContext`v0$$ = 
        0, $CellContext`vBar$$ = 1}, "ControllerVariables" :> {
        Hold[$CellContext`vBar$$, $CellContext`vBar$525$$, 0], 
        Hold[$CellContext`v0$$, $CellContext`v0$526$$, 0], 
        Hold[$CellContext`g$$, $CellContext`g$527$$, 0]}, 
      "OtherVariables" :> {
       Typeset`show$$, Typeset`bookmarkList$$, Typeset`bookmarkMode$$, 
        Typeset`animator$$, Typeset`animvar$$, Typeset`name$$, 
        Typeset`specs$$, Typeset`size$$, Typeset`update$$, Typeset`initDone$$,
         Typeset`skipInitDone$$}, "Body" :> Show[
        Plot[{$CellContext`v0$$, $CellContext`vBar$$, $CellContext`vBar$$ + \
($CellContext`v0$$ - $CellContext`vBar$$) 
           Exp[(-$CellContext`g$$) $CellContext`t]}, {$CellContext`t, 0, 10}, 
         PlotStyle -> {
           Directive[Green, Dashed], 
           Directive[Red, Dashed], Blue}, 
         PlotRange -> {0, 1.1 Max[$CellContext`vBar$$, $CellContext`v0$$]}, 
         GridLines -> Automatic, Frame -> True, 
         FrameLabel -> {{"v (m/s)", ""}, {"t (s)", 
            StringJoin["g = ", 
             ToString[$CellContext`g$$]]}}], 
        Graphics[
         Text[
         "\!\(\*OverscriptBox[\(v\), \(_\)]\)", {
          9, $CellContext`vBar$$ + 
           0.05 Max[$CellContext`vBar$$, $CellContext`v0$$]}]], 
        Graphics[
         Text[
         "v[0]", {
          9, $CellContext`v0$$ + 
           0.05 Max[$CellContext`vBar$$, $CellContext`v0$$]}]]], 
      "Specifications" :> {{{$CellContext`vBar$$, 1, 
          "Target Velocity (\!\(\*OverscriptBox[\(v\), \(_\)]\))"}, 1, 
         10}, {{$CellContext`v0$$, 0, "Initial Velocity (v0)"}, 0, 
         Dynamic[
         2 $CellContext`vBar$$]}, {{$CellContext`g$$, 1, "Car Gain (g)"}, 0.1,
          10}}, "Options" :> {}, "DefaultOptions" :> {}],
     ImageSizeCache->{403., {189., 195.}},
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
WindowSize->{657.7833333333333, 2752.24},
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
Cell[1257, 32, 58, 0, 36, "Title"],
Cell[1318, 34, 57, 0, 16, "Subsubtitle"],
Cell[1378, 36, 68, 0, 16, "Subsubtitle"],
Cell[CellGroupData[{
Cell[1471, 40, 49, 0, 25, "Section"],
Cell[1523, 42, 764, 15, 282, "Text"]
}, Open  ]],
Cell[CellGroupData[{
Cell[2324, 62, 67, 0, 25, "Section"],
Cell[2394, 64, 108, 1, 16, "Text"],
Cell[2505, 67, 5180, 120, 265, "Input",
 Evaluatable->False],
Cell[7688, 189, 664, 19, 220, "Text"],
Cell[CellGroupData[{
Cell[8377, 212, 1415, 39, 19, "Input",
 CellOpen->False],
Cell[9795, 253, 1889, 38, 322, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[11733, 297, 69, 0, 25, "Section"],
Cell[11805, 299, 104, 1, 16, "Text"],
Cell[11912, 302, 5581, 133, 265, "Input",
 Evaluatable->False],
Cell[17496, 437, 966, 33, 183, "Text"],
Cell[CellGroupData[{
Cell[18487, 474, 326, 10, 12, "Input"],
Cell[18816, 486, 96, 2, 32, "Output"]
}, Open  ]],
Cell[18927, 491, 857, 28, 99, "Text"],
Cell[CellGroupData[{
Cell[19809, 523, 463, 13, 28, "Input"],
Cell[20275, 538, 282, 9, 15, "Output"]
}, Open  ]],
Cell[20572, 550, 135, 3, 16, "Text"],
Cell[CellGroupData[{
Cell[20732, 557, 3405, 89, 19, "Input",
 CellOpen->False],
Cell[24140, 648, 3130, 65, 386, "Output"]
}, Open  ]]
}, Open  ]]
}, Open  ]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature BxDOh3Rz8M4RpCKWaYC#xV0u *)
