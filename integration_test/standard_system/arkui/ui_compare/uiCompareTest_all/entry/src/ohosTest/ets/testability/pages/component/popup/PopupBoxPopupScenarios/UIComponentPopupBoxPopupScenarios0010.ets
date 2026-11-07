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
struct UIComponentPopupBoxPopupScenarios0010 {
  @State name: string = 'UIComponentPopupBoxPopupScenarios0010';
  @State message: string = this.name;
  @State handlePopup: boolean = false;
  @State customPopup: boolean = false;

  @Builder popupBuilder1() {
    Row({ space: 2 }) {
      Image('/images/app_icon.png')
        .backgroundColor(Color.Green)
        .width(24)
        .height(24)
        .margin({
          left: 10,
          right: 10,
          top: 20,
          bottom: 20
        })

      Text('Popup1')
        .bindPopup(this.customPopup, {
          builder: this.popupBuilder2,
          placement: Placement.Bottom,
          mask: {color:'#33000000'},
          popupColor: Color.Orange,
          enableArrow: true,
          keyboardAvoidMode: KeyboardAvoidMode.DEFAULT,
          showInSubWindow: false,
          onStateChange: (e) => {
            if (!e.isVisible) {
              this.customPopup = false;
            }
          }
        })
        .fontSize(10)
        .fontColor(Color.Black)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)
        .margin({
          left: 6,
          right: 6,
          top: 10,
          bottom: 10
        })

    }
    .width('100%')
    .height('100%')
    .padding(5)
  }

  @Builder popupBuilder2() {
    Row({ space: 2 }) {
      Image('/images/app_icon.png')
        .backgroundColor(Color.Green)
        .width(24)
        .height(24)
        .margin({
          left: 10,
          right: 10,
          top: 20,
          bottom: 20
        })

      Text('Popup2')
        .bindPopup(this.customPopup, {
          builder: this.popupBuilder3,
          placement: Placement.Bottom,
          mask: {color:'#33000000'},
          popupColor: Color.Orange,
          enableArrow: true,
          keyboardAvoidMode: KeyboardAvoidMode.DEFAULT,
          showInSubWindow: false,
          onStateChange: (e) => {
            if (!e.isVisible) {
              this.customPopup = false;
            }
          }
        })
        .fontSize(10)
        .fontColor(Color.Black)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)
        .margin({
          left: 6,
          right: 6,
          top: 10,
          bottom: 10
        })

    }
    .width('13.89%')
    .height('4.1%')
    .padding(5)
  }

  @Builder popupBuilder3() {
    Row({ space: 2 }) {
      Image('/images/app_icon.png')
        .backgroundColor(Color.Green)
        .width(24)
        .height(24)
        .margin({
          left: 10,
          right: 10,
          top: 20,
          bottom: 20
        })

      Text('Popup3')
        .fontSize(10)
        .fontColor(Color.Black)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)
        .margin({
          left: 6,
          right: 6,
          top: 10,
          bottom: 10
        })

    }
    .width('13.89%')
    .height('4.1%')
    .padding(5)
  }

  build() {
    Column() {
      Text(this.name)
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

      Button('CustomPopupOptions')
        .id(this.name + '_01')
        .borderRadius(20)
        .backgroundColor(0x317aff)
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin(10)
        .onClick(() => {
          this.customPopup = !this.customPopup;
        })
        .bindPopup(this.customPopup, {
          builder: this.popupBuilder1,
          placement: Placement.Top,
          mask: {color:'#33000000'},
          popupColor: Color.Yellow,
          enableArrow: true,
          keyboardAvoidMode: KeyboardAvoidMode.DEFAULT,
          showInSubWindow: false,
          onStateChange: (e) => {
            if (!e.isVisible) {
              this.customPopup = false;
            }
          }
        })
      
    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
  }
}
