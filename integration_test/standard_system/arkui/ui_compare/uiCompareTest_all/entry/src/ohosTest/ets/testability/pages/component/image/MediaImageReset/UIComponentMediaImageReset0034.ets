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
struct UIComponentMediaImageReset0034 {
  @State name: string = 'UIComponentMediaImageReset0034';
  @State message: string = 'UIComponentMediaImageReset0034';
  @State imageSrcIndex: number = 0;
  @State imageSrcList: (ResourceStr | ImageContent)[] = ['/images/app_icon.png', ImageContent.EMPTY];
  @State draggbleFlag: boolean = false;

  build() {
    Column() {
      Text(this.message)
        .margin(10)

      Image(this.imageSrcList[this.imageSrcIndex])
        .onComplete((event) => {
          this.message += '\n image onComplete, width: ' + event?.width + ', height: ' + event?.height;
        })
        .onError((error: ImageError) => {
          this.message += '\n image onError, err: ' + JSON.stringify(error);
        })
        .draggable(this.draggbleFlag)
        .backgroundColor(Color.Green)
        .id(this.name + '_01')
        .width(50)
        .height(50)

      Button('设置draggable属性为true后ImageContent.EMPTY')
        .onClick(() => {
          this.draggbleFlag = true;
          this.imageSrcIndex = (this.imageSrcIndex + 1) % this.imageSrcList.length;
        })
        .id(this.name + '_02')
        .margin(10)

    }
    .width('100%')
    .height('100%')
  }
}
