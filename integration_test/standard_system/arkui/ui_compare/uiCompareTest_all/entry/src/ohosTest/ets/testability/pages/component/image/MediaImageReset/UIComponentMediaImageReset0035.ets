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
struct UIComponentMediaImageReset0035 {
  @State name: string = 'UIComponentMediaImageReset0035';
  @State message: string = 'UIComponentMediaImageReset0035';
  @State imageSrcIndex: number = 0;
  @State imageSrcList: (ResourceStr | ImageContent)[] = ['/images/app_icon.png', ImageContent.EMPTY];
  @State enableAnalyzerFlag: boolean = true;
  private aiController: ImageAnalyzerController = new ImageAnalyzerController();
  private options: ImageAIOptions = {
    types: [ImageAnalyzerType.SUBJECT, ImageAnalyzerType.TEXT],
    aiController: this.aiController
  };

  build() {
    Column() {
      Text(this.message)
        .margin(10)

      Image(this.imageSrcList[this.imageSrcIndex])
      // Image(this.imageSrcList[this.imageSrcIndex], this.options)
        .onComplete((event) => {
          this.message += '\n image onComplete, width: ' + event?.width + ', height: ' + event?.height;
        })
        .onError((error: ImageError) => {
          this.message += '\n image onError, err: ' + JSON.stringify(error);
        })
        .draggable(this.enableAnalyzerFlag)
        .backgroundColor(Color.Green)
        .id(this.name + '_01')
        .width(50)
        .height(50)

      Button('设置enableAnalyzer属性为true后ImageContent.EMPTY')
        .onClick(() => {
          this.enableAnalyzerFlag = true;
          this.imageSrcIndex = (this.imageSrcIndex + 1) % this.imageSrcList.length;
        })
        .id(this.name + '_02')
        .margin(10)

      Button('getImageAnalyzerSupportTypes')
        .width(80)
        .height(80)
        .onClick(() => {
          this.message += '\ngetImageAnalyzerSupportTypes: ' + JSON.stringify(this.aiController.getImageAnalyzerSupportTypes());
        })

    }
    .width('100%')
    .height('100%')
  }
}
