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
struct UIComponentMediaImageSvgAnimateTransform0022 {
  @State name: string = 'UIComponentMediaImageSvgAnimateTransform0022';
  @State message: string = 'UIComponentMediaImageSvgAnimateTransform0022';

  build() {
    Column() {
      Text(this.message)
        .margin(10)

      Text('预置的svg图源：')
      Image('/images/UIComponentMediaImageSvgAnimateTransform0022.svg')
        .onComplete((event) => {
          this.message += '\n svg image onComplete, width: ' + event?.width + ', height: ' + event?.height;
        })
        .onError((error: ImageError) => {
          this.message += '\n svg image onError, err: ' + JSON.stringify(error);
        })
        .width(50)
        .height(50)

    }
    .width('100%')
    .height('100%')
  }
}
