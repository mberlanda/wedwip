[1mdiff --git a/app/views/static_pages/_body.html b/app/views/static_pages/_body.html[m
[1mindex 3897431..64f88c4 100644[m
[1m--- a/app/views/static_pages/_body.html[m
[1m+++ b/app/views/static_pages/_body.html[m
[36m@@ -1,120 +1,3 @@[m
[31m-<section id="collection" class="bg-gray">[m
[31m-    <div class="container wow fadeIn">[m
[31m-        <div class="row text-center">[m
[31m-            <div class="col-lg-12">[m
[31m-                <h2>Collection</h2>[m
[31m-                <hr class="colored">[m
[31m-                <p>Here is a sample of items from our Spring 2015 collection.</p>[m
[31m-            </div>[m
[31m-        </div>[m
[31m-        <div class="row content-row">[m
[31m-            <div class="col-lg-12">[m
[31m-                <div class="portfolio-gallery">[m
[31m-                    <div class="item">[m
[31m-                        <a href="assets/img/fashion/gallery/1.jpg" class="gallery-link" title="Bombay Jeans">[m
[31m-                            <img src="assets/img/fashion/gallery/1.jpg" class="img-responsive img-centered" alt="">[m
[31m-                        </a>[m
[31m-                    </div>[m
[31m-                    <div class="item">[m
[31m-                        <a href="assets/img/fashion/gallery/2.jpg" class="gallery-link" title="Designer Purse">[m
[31m-                            <img src="assets/img/fashion/gallery/2.jpg" class="img-responsive img-centered" alt="">[m
[31m-                        </a>[m
[31m-                    </div>[m
[31m-                    <div class="item">[m
[31m-                        <a href="assets/img/fashion/gallery/3.jpg" class="gallery-link" title="Casual Collection">[m
[31m-                            <img src="assets/img/fashion/gallery/3.jpg" class="img-responsive img-centered" alt="">[m
[31m-                        </a>[m
[31m-                    </div>[m
[31m-                    <div class="item">[m
[31m-                        <a href="assets/img/fashion/gallery/4.jpg" class="gallery-link" title="Evening Bag">[m
[31m-                            <img src="assets/img/fashion/gallery/4.jpg" class="img-responsive img-centered" alt="">[m
[31m-                        </a>[m
[31m-                    </div>[m
[31m-                    <div class="item">[m
[31m-                        <a href="assets/img/fashion/gallery/5.jpg" class="gallery-link" title="Earthy Wrap">[m
[31m-                            <img src="assets/img/fashion/gallery/5.jpg" class="img-responsive img-centered" alt="">[m
[31m-                        </a>[m
[31m-                    </div>[m
[31m-                    <div class="item">[m
[31m-                        <a href="assets/img/fashion/gallery/6.jpg" class="gallery-link" title="Boots and Polka Dots">[m
[31m-                            <img src="assets/img/fashion/gallery/6.jpg" class="img-responsive img-centered" alt="">[m
[31m-                        </a>[m
[31m-                    </div>[m
[31m-                </div>[m
[31m-            </div>[m
[31m-        </div>[m
[31m-    </div>[m
[31m-</section>[m
[31m-<section id="locations" class="pricing" style="background-image: url('assets/img/fashion/bg-locations.jpg')">[m
[31m-    <div class="container wow fadeIn">[m
[31m-        <div class="row text-center">[m
[31m-            <div class="col-lg-12">[m
[31m-                <h2>Locations</h2>[m
[31m-                <hr class="colored">[m
[31m-                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eum, quae, laborum, voluptate delectus odio doloremque error porro obcaecati nemo animi ducimus quaerat nostrum? Ab molestiae eaque et atque architecto reiciendis.</p>[m
[31m-            </div>[m
[31m-        </div>[m
[31m-        <div class="row content-row">[m
[31m-            <div class="col-md-4">[m
[31m-                <div class="pricing-item">[m
[31m-                    <h3>Beaumont</h3>[m
[31m-                    <hr class="colored">[m
[31m-                    <ul class="list-group">[m
[31m-                        <li class="list-group-item">[m
[31m-                            <em>Hours:</em>[m
[31m-                            <br>Mon - Fri: 9:00am to 7:00pm[m
[31m-                            <br>Sat - Sun: 10:00am to 8:00pm</li>[m
[31m-                        <li class="list-group-item">[m
[31m-                            <em>Phone:</em>[m
[31m-                            <br>394-555-5555</li>[m
[31m-                        <li class="list-group-item">[m
[31m-                            <em>Address:</em>[m
[31m-                            <br>8372 Greenway Ct.[m
[31m-                            <br>Beaumont, CA 49204</li>[m
[31m-                    </ul>[m
[31m-                </div>[m
[31m-            </div>[m
[31m-            <div class="col-md-4">[m
[31m-                <div class="pricing-item">[m
[31m-                    <h3>Bakersville</h3>[m
[31m-                    <hr class="colored">[m
[31m-                    <ul class="list-group">[m
[31m-                        <li class="list-group-item">[m
[31m-                            <em>Hours:</em>[m
[31m-                            <br>Mon - Fri: 9:00am to 7:00pm[m
[31m-                            <br>Sat - Sun: 10:00am to 8:00pm</li>[m
[31m-                        <li class="list-group-item">[m
[31m-                            <em>Phone:</em>[m
[31m-                            <br>526-555-5555</li>[m
[31m-                        <li class="list-group-item">[m
[31m-                            <em>Address:</em>[m
[31m-                            <br>324 Kingston Dr.[m
[31m-                            <br>Santa Monica, CA 49204</li>[m
[31m-                    </ul>[m
[31m-                </div>[m
[31m-            </div>[m
[31m-            <div class="col-md-4">[m
[31m-                <div class="pricing-item">[m
[31m-                    <h3>Downtown</h3>[m
[31m-                    <hr class="colored">[m
[31m-                    <ul class="list-group">[m
[31m-                        <li class="list-group-item">[m
[31m-                            <em>Hours:</em>[m
[31m-                            <br>Mon - Fri: 9:00am to 8:00pm[m
[31m-                            <br>Sat - Sun: 11:00am to 11:00pm</li>[m
[31m-                        <li class="list-group-item">[m
[31m-                            <em>Phone:</em>[m
[31m-                            <br>474-555-5555</li>[m
[31m-                        <li class="list-group-item">[m
[31m-                            <em>Address:</em>[m
[31m-                            <br>74 Main St. Suite #2[m
[31m-                            <br>Los Angeles, CA 49204</li>[m
[31m-                    </ul>[m
[31m-                </div>[m
[31m-            </div>[m
[31m-        </div>[m
[31m-    </div>[m
[31m-</section>[m
 <section id="testimonials" class="testimonials">[m
     <div class="container wow fadeIn">[m
         <div class="row">[m
[1mdiff --git a/app/views/static_pages/home.html.haml b/app/views/static_pages/home.html.haml[m
[1mindex 90b5a44..588ab6e 100644[m
[1m--- a/app/views/static_pages/home.html.haml[m
[1m+++ b/app/views/static_pages/home.html.haml[m
[36m@@ -3,4 +3,7 @@[m
 = render partial:  'team'[m
 = render partial:  'quote'[m
 = render partial:  'process'[m
[32m+[m[32m= render partial: 'collection'[m
[32m+[m[32m= render partial: 'locations'[m
[32m+[m[32m= render partial: 'testimonials'[m
 = render partial:  'body'[m
\ No newline at end of file[m
