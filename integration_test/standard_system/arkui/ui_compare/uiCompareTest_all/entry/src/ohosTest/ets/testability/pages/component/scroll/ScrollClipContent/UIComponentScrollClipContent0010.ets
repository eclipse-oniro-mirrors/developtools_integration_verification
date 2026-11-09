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
import { LengthMetrics, uiAppearance } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct UIComponentScrollClipContent0010 {
  @State name: string = 'UIComponentScrollClipContent0010';
  @State message: string = 'UIComponentScrollClipContent0010';
  @State scrollSafeAreaPadding: Padding = {
    top: 30,
    bottom: '10%',
    left: 10,
    right: '30%'
  };
  @State scrollPadding: Padding = {
    top: 50,
    bottom: '20%',
    left: 30,
    right: '30%'
  };
  @State arr: number[] = [];
  @State scrollContentClipMode: ContentClipMode = ContentClipMode.CONTENT_ONLY;
  @State scrollContentClipModeFlag: string = 'ContentClipMode.CONTENT_ONLY';

  @Styles
  listCard() {
    .backgroundColor(Color.White)
    .height(72)
    .width('100%')
    .borderRadius(12)
  }

  aboutToAppear(): void {
    this.message += `\n scrollSafeAreaPadding: ${JSON.stringify(this.scrollSafeAreaPadding)}`;
    this.message += `\n scrollPadding: ${JSON.stringify(this.scrollPadding)}`;
    for (let i = 0; i < 15; i++) {
      this.arr.push(i);
    }
  }

  build() {
    Column() {
      Column() {
        Text(this.message + '\nscrollContentClipMode: ' + this.scrollContentClipModeFlag)
          .margin(10)
          .textAlign(TextAlign.Center)
        Button('Switch scrollContentClipMode')
          .id(this.name + '_01')
          .onClick(() => {
            switch (this.scrollContentClipModeFlag) {
              case 'ContentClipMode.CONTENT_ONLY':
                this.scrollContentClipMode = ContentClipMode.BOUNDARY;
                this.scrollContentClipModeFlag = 'ContentClipMode.BOUNDARY';
                break;
              case 'ContentClipMode.BOUNDARY':
                this.scrollContentClipMode = ContentClipMode.SAFE_AREA;
                this.scrollContentClipModeFlag = 'ContentClipMode.SAFE_AREA';
                break;
              case 'ContentClipMode.SAFE_AREA':
                this.scrollContentClipMode = ContentClipMode.CONTENT_ONLY;
                this.scrollContentClipModeFlag = 'ContentClipMode.CONTENT_ONLY';
                break;
            }
          })
      }
      .width('100%')
      .height('20%')

      Scroll() {
        Column() {
          List({ space: 10 }) {
            ForEach(this.arr, (item: number) => {
              ListItem() {
                Text('item' + item)
                  .fontSize(16)
              }
              .listCard()
            }, (item: string) => item)
          }
          .id(this.name + '_01')
          .width('100%')
          .nestedScroll({
            scrollForward: NestedScrollMode.PARENT_FIRST,
            scrollBackward: NestedScrollMode.SELF_FIRST
          })
        }
        .width('100%')
        .height('100%')
        .backgroundColor(Color.Yellow)
      }
      .friction(0.6)
      .backgroundColor(Color.Brown)
      .safeAreaPadding(this.scrollSafeAreaPadding)
      .padding(this.scrollPadding)
      .clipContent(this.scrollContentClipMode)
      .width('100%')
      .height('80%')
    }
  }
}
