/*
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { BusinessError, commonEventManager } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@Component
struct UIComponentMediaVideoReset011 {
  @State name: string = 'UIComponentMediaVideoReset011';
  @State err: string = '';
  private controller: VideoController = new VideoController()
  private videoSrc: string = ('https://' + 'www.runoob.com' + '/try/demo_source/movie.mp4')
  // private videoSrc: string = 'https://media.w3.org/2010/05/sintel/trailer.mp4'

   build() {
     Row() {
       Column() {

         Text(this.err)

         Button('start')
           .id(this.name + '_001')
           .onClick(() => {
             this.controller.start();
             this.err = '';
           })
           .margin({bottom: 10})

         Button('reset')
           .id(this.name + '_002')
           .onClick(() => {
             this.controller.reset();
           })
           .margin({bottom: 10})

         Video({
           src: this.videoSrc,
           controller: this.controller
         })
           .height('50%')
           .onError(() => {
             this.err = 'Error occurs.';
           })
       }
       .width('100%')
       .height('100%')
     }
   }
 }