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
struct UIComponentSpecialComponentsXComponentOnload0040 {
  @State name: string = 'UIComponentSpecialComponentsXComponentOnload0040';
  @State message: string = 'message is null';
  @State surfaceID: string = 'Haven\'t got XComponent surfaceID. ';
  @State xc_width: number = 300;
  @State xc_height: number = 500;
  myXComponentController: XComponentController = new XComponentController();

  build() {
    Column() {

      XComponent({
        id: this.name + '_01',
        type: XComponentType.TEXTURE,
        libraryname: 'nativerender',
        controller: this.myXComponentController
      })
        .onLoad(() => {
          this.message = 'XComponent onLoad triggered.';
        })
        .width(this.xc_width)
        .height(this.xc_height)

      Text(this.message)
        .margin(20)

      Button('setXComponentSurfaceSize')
        .margin(20)
        .id(this.name + '_02')
        .onClick(() => {
          this.myXComponentController.setXComponentSurfaceSize({surfaceWidth: 200, surfaceHeight: 400});
        })

      Button('getXComponentSurfaceID')
        .margin(20)
        .id(this.name + '_03')
        .onClick(() => {
          this.surfaceID = 'XComponent surfaceID: ' + this.myXComponentController.getXComponentSurfaceId();
        })

      Text(this.surfaceID)
        .margin(20)

    }
    .width('100%')
    .height('100%')
  }
}
