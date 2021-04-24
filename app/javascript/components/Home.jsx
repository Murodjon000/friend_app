import React from "react";
import "bootstrap/dist/css/bootstrap.min.css";
import $ from "jquery";
import Popper from "popper.js";
import "bootstrap/dist/js/bootstrap.bundle.min";

export default ({ title, head }) => (
  <div className="row">
    <div className="col-md-4">
      <h1>Find Amazing Friend</h1>
      <h2>With Us.Lets go....</h2>
    </div>
    <div className="col-md-8">
      <img src="photo.png" alt="" srcset="" />
      <h1>{title}</h1>
    </div>
  </div>
);
