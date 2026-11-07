/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

@Entry
@Component
struct XComponent04 {
  @State surfaceHeight: number = 150;
  xComponentController: XComponentController = new XComponentController();

  build() {
    Column({ space: 20 }) {
      Text('Surface类型 - 动态设置surfaceHeight测试')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      Text(`当前surfaceHeight: ${this.surfaceHeight}`)
        .fontSize(14)
        .fontColor(0x666666)

      XComponent({
        type: XComponentType.SURFACE,
        controller: this.xComponentController
      })
        .id('surface_xcomponent')
        .width(300)
        .height(200)
        .backgroundColor(0xE5E5E5)
        .onLoad(() => {
          this.updateSurfaceRect();
        })

      Row({ space: 10 }) {
        Button('height = 80')
          .id('xcomponent04_button1')
          .onClick(() => {
            this.surfaceHeight = 80;
            this.updateSurfaceRect();
            console.info('XComponent04: surfaceHeight设置为80');
          })

        Button('height = 120')
          .id('xcomponent04_button2')
          .onClick(() => {
            this.surfaceHeight = 120;
            this.updateSurfaceRect();
            console.info('XComponent04: surfaceHeight设置为120');
          })

        Button('height = 150')
          .id('xcomponent04_button3')
          .onClick(() => {
            this.surfaceHeight = 150;
            this.updateSurfaceRect();
            console.info('XComponent04: surfaceHeight设置为150');
          })
      }
      .margin({ top: 10 })

      Row({ space: 10 }) {
        Button('height = 180')
          .id('xcomponent04_button4')
          .onClick(() => {
            this.surfaceHeight = 180;
            this.updateSurfaceRect();
            console.info('XComponent04: surfaceHeight设置为180');
          })

        Button('height = 200')
          .id('xcomponent04_button5')
          .onClick(() => {
            this.surfaceHeight = 200;
            this.updateSurfaceRect();
            console.info('XComponent04: surfaceHeight设置为200');
          })

        Button('height = 250')
          .id('xcomponent04_button6')
          .onClick(() => {
            this.surfaceHeight = 250;
            this.updateSurfaceRect();
            console.info('XComponent04: surfaceHeight设置为250');
          })
      }

    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor(0xF5F5F5)
  }

  private updateSurfaceRect() {
    this.xComponentController.setXComponentSurfaceRect({
      offsetX: 0,
      offsetY: 0,
      surfaceWidth: 200,
      surfaceHeight: this.surfaceHeight
    });
  }
}
