Side Regions PDF Customization
==============================

Developer: W. Eliot Kimber, ekimber@contrext.com

Date: 7 June 2014

This PDF customization reworks the page masters to
define side regions (region-start and region-end) for
all the pages, replacing the base technique of using
margins on the page.

The changes from the base layout masters approach is

1. Remove the left and right (start and end) margins 
   from the page. This makes the entire physical extent 
   of the page available for marks.
   
   If you specify margins on the page then you can't place
   anything in that area. It also requires you to then
   set left and right margins on the top and bottom 
   (before and after) regions in order to make their content
   fit within the width of the body region.
   
2. Set the margins on the region-body equal to the page
   margins. This moves the edges of the region body in
   from the physical edge of the page so that it will
   not overlap the edge regions.
   
3. Define region-start and region-end on each page master.
   The regions' @extent values are set to the page margin
   value, making them as wide as the intended margin.
   This means they will be exactly adjacent to the left
   and right edges of the body region.
   
4. Set the background color on the edge regions to yellow
   to verify that they are actually being generated.
   In a real customization you probably wouldn't have
   yellow borders on your pages.
   
To adapt this to real use you can simply remove the background-color
attributes from the fo:region-start and fo:region-end elements.

You can use edge regions for things like thumb tabs, chapter titles,
icons used for navigation, etc. To use them you need to override
the main chapter-creation template in order to add generation of
static content for these new regions since the base PDF transform
does not use side regions.

         