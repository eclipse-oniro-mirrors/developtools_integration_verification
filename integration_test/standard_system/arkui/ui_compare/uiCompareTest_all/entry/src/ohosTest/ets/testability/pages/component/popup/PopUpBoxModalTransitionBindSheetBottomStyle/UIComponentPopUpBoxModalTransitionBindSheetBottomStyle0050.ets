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
struct UIComponentPopUpBoxModalTransitionBindSheetBottomStyle0050 {
  @State name: string = 'UIComponentPopUpBoxModalTransitionBindSheetBottomStyle0050';
  @State message: string = this.name;
  @State isShow: boolean = false;
  @State sheetHeight: number | SheetSize = 300;
  @State offsetX: number = 0;
  @State offsetY: number = 0;
  @State offsetInfo: string = '';
  sheetType: SheetType = SheetType.BOTTOM;
  switchedFlag: boolean = false;

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

      Button('Switch Offset')
        .id(this.name + '_01')
        .borderRadius(20)
        .backgroundColor(0x317aff)
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin(10)
        .onClick(() => {
          if (this.switchedFlag) {
            this.offsetX = 0;
            this.offsetY = 0;
            this.switchedFlag = !this.switchedFlag;
            this.offsetInfo = `Offset set to: {x: ${this.offsetX}, y: ${this.offsetY}}`;
          } else {
            this.offsetX = -50;
            this.offsetY = -50;
            this.switchedFlag = !this.switchedFlag;
            this.offsetInfo = `Offset set to: {x: ${this.offsetX}, y: ${this.offsetY}}`;
          }
        })

      Text(this.offsetInfo)
        .fontSize(16)
        .fontColor(Color.Blue)
        .fontWeight(FontWeight.Medium)
        .textAlign(TextAlign.Center)
        .margin({
          left: 6,
          right: 6,
          top: 10,
          bottom: 10
        })

      Button('transition modal 1')
        .onClick(() => {
          this.isShow = true;
        })
        .id(this.name + '_02')
        .borderRadius(20)
        .backgroundColor(0x317aff)
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin(10)
        .bindSheet($$this.isShow, this.myBuilder(), {
          offset: {
            x: this.offsetX,
            y: this.offsetY
          },
          height: this.sheetHeight,
          backgroundColor: Color.Green,
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