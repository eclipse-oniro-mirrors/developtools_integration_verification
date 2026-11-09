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

import { image } from '@kit.ImageKit';
import { LengthMetrics } from '@kit.ArkUI';

@Entry
@Component
struct UiComponentTextTimingOptimization04 {
  @State message: string = 'Hello World';
  imagePixelMap: image.PixelMap | undefined = undefined;
  @State imagePixelMap3: image.PixelMap | undefined = undefined;
  mutableStr: MutableStyledString = new MutableStyledString('123');
  controller: TextController = new TextController();
  controller2: TextController = new TextController();
  private uiContext: UIContext = this.getUIContext();
  mutableStyledString1: MutableStyledString = new MutableStyledString('哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈', [{
    start: 0,
    length: 11,
    styledKey: StyledStringKey.BASELINE_OFFSET,
    styledValue: new BaselineOffsetStyle(LengthMetrics.vp(20))
  }]);

  aboutToAppear(): void {
    this.controller2.setStyledString(this.mutableStyledString1)
  }
  private async getPixmapFromMedia(resource: Resource) {
    let unit8Array = await this.uiContext.getHostContext()?.resourceManager?.getMediaContent({
      bundleName: resource.bundleName,
      moduleName: resource.moduleName,
      id: resource.id
    });
    let imageSource = image.createImageSource(unit8Array?.buffer.slice(0, unit8Array.buffer.byteLength));
    let createPixelMap: image.PixelMap = await imageSource.createPixelMap({
      desiredPixelFormat: image.PixelMapFormat.RGBA_8888
    });
    await imageSource.release();
    return createPixelMap;
  }
  build() {
    Row() {
      Column({ space: 5 }) {
        Text('set BASELINE_OFFSET')
          .copyOption(CopyOptions.InApp)
          .draggable(true)
          .fontSize(15)
          .fontColor(Color.Red)
          .width('90%')
          .border({ width: 1 })
          .lineHeight(20)
          .maxLines(2)
          .margin(30)
          .padding(10)
        Text(undefined, { controller: this.controller2 })
          .copyOption(CopyOptions.InApp)
          .draggable(true)
          .fontSize(30)
          .width('90%')
          .border({ width: 1 })
          .lineHeight(20)
          .margin(30)
          .padding(10)
          .id('UiComponentTextTimingOptimization04')
      }
      .width('100%')
    }
    .height('100%')
  }
}
