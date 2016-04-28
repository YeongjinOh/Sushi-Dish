# Sushi-Dish
Object detection and classification from real images  
  
  
### Edge Detection and Preprocessing
For detecting ellipse, we need to detect edge and preprocess it.  
Edge Processing consists of following four steps:
 
<ol>
<li>Edge detection.</li>
<p>Extracts Edge Map from given image and preprocess it to reduce complexity.</p>  

<li>Edge Contours extraction.</li>
<p>Extracts Edge Contours from given Edge Map.</p>

<li>Line segment fitting.</li>
<p>Extracts Line Segments fitting on the Edge Contour.</p>

<li> Detecting edge portions with Smooth Curvatures.</li>
<p>Classify edges using Curvatures so that every edge doesn't have a sudden change which is called sharp turn and a inflexion point.</p>  
</ol>
You can get the list of edges with Smooth Curvatures using *edgeProcessing* function :  
*im = imread('ANYIMAGE.jpg');*  
*SmoothCurvatures = edgeProcessing(im);*


