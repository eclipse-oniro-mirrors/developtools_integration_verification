/*
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
import { uiAppearance } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct UIComponentSpecialComponentsXComponentOnload0080 {
  @State name: string = 'UIComponentSpecialComponentsXComponentOnload0080';
  @State message: string = 'message is null';
  @State surfaceRectStr: string = 'Haven\'t got XComponent surfaceRect. ';
  @State xc_width: number = 300;
  @State xc_height: number = 500;
  myXComponentController: XComponentController = new XComponentController();
  private onloadTimes = 0;

  build() {
    Column() {

      XComponent({
        id: this.name + '_01',
        type: XComponentType.TEXTURE,
        libraryname: 'nativerender',
        controller: this.myXComponentController
      })
        .onLoad(() => {
          this.onloadTimes ++;
          this.message = `XComponent onLoad triggered for ${this.onloadTimes} times.`;
        })
        .width(this.xc_width)
        .height(this.xc_height)

      Text(this.message)
        .margin(5)

      Button(`setXComponentSurfaceRect`)
        .margin(5)
        .id(this.name + '_02')
        .onClick(() => {
          this.myXComponentController.setXComponentSurfaceRect({
            offsetX: 10,
            offsetY: 10,
            surfaceWidth: 200,
            surfaceHeight: 400
          })
        })

      Button('getXComponentSurfaceRect')
        .margin(5)
        .id(this.name + '_03')
        .onClick(() => {
          this.surfaceRectStr = 'XComponent surfaceRect: ' + JSON.stringify(this.myXComponentController.getXComponentSurfaceRect());
        })

      Text(this.surfaceRectStr)
        .margin(5)

    }
    .width('100%')
    .height('100%')
  }
}
