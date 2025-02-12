// Import and register all your controllers from the importmap via controllers/**/*_controller
import { application } from "controllers/application"
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)

import ModalController from "./modal_controller";
application.register("modal", ModalController);

import StyleController from "./style_controller";
application.register("style", StyleController);

import InfiniteScrollController from "./infinite_scroll_controller"; 
application.register("infinite-scroll", InfiniteScrollController);