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

@Entry
@Component
struct UIComponentPopupBoxModalTransitionHover0060 {
  @State name: string = 'UIComponentPopupBoxModalTransitionHover0060';
  @State message: string = this.name;
  @State isShow: boolean = false;
  @State sheetHeight: number = 400;
  @State offsetX: number = 0;
  @State offsetY: number = 0;
  @State offsetInfo: string = '';
  @State enableHoverMode: boolean = false;
  @State hoverModeArea: HoverModeAreaType = HoverModeAreaType.BOTTOM_SCREEN
  sheetType: SheetType = SheetType.CENTER;
  titleStr: string = 'BindSheet Title';

  @Builder
  myBuilder() {
    Column() {
      Button('change height')
        .margin(10)
        .fontSize(20)
        .onClick(() => {
          this.sheetHeight = 500;
        })

      Button('Set Illegal height')
        .margin(10)
        .fontSize(20)
        .onClick(() => {
          this.sheetHeight = -1;
        })

      Button('close modal 1')
        .margin(10)
        .fontSize(20)
        .onClick(() => {
          this.isShow = false;
        })
    }
    .width('100%')
    .height('100%')
  }

  build() {
    Column() {
      Text(this.message)
        .fontSize(20)
        .fontColor(Color.Black)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)
        .margin({
          left: 6,
          right: 6,
          top: 10,
          bottom: 10
        })

      Button('bindsheet')
        .onClick(() => {
          this.isShow = true;
        })
        .id(this.name + '_01')
        .borderRadius(20)
        .backgroundColor(0x317aff)
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin(10)
        .bindSheet($$this.isShow, this.myBuilder(), {
          width: 300,
          enableHoverMode: this.enableHoverMode,
          offset: {
            x: this.offsetX,
            y: this.offsetY
          },
          title: {
            title: this.titleStr,
            subtitle: this.titleStr
          },
          height: this.sheetHeight,
          backgroundColor: Color.Yellow,
          preferType: this.sheetType,
          onWillAppear: () => {
            console.log('BindSheet onWillAppear.');
            this.message += '\n BindSheet onWillAppear.';
          },
          onAppear: () => {
            console.log('BindSheet onAppear.');
            this.message += '\n BindSheet onAppear.';
          },
          onWillDisappear: () => {
            console.log('BindSheet onWillDisappear.');
            this.message += '\n BindSheet onWillDisappear.';
          },
          onDisappear: () => {
            console.log('BindSheet onDisappear.');
            this.message += '\n BindSheet onDisappear.';
          }
        })
      
    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
  }
}
