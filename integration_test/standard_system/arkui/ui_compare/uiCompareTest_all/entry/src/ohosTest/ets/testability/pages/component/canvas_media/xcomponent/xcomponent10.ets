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
struct XComponent10 {
  @State surfaceWidth: number = 200;
  xComponentController: XComponentController = new XComponentController();

  build() {
    Column({ space: 20 }) {
      Text('Texture类型 - 动态设置surfaceWidth测试')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      Text(`当前surfaceWidth: ${this.surfaceWidth}`)
        .fontSize(14)
        .fontColor(0x666666)

      XComponent({
        type: XComponentType.TEXTURE,
        controller: this.xComponentController
      })
        .id('texture_xcomponent')
        .width(300)
        .height(200)
        .backgroundColor(0xE5E5E5)
        .onLoad(() => {
          this.updateSurfaceRect();
        })

      Row({ space: 10 }) {
        Button('width = 100')
          .id('xcomponent10_button1')
          .onClick(() => {
            this.surfaceWidth = 100;
            this.updateSurfaceRect();
            console.info('XComponent10: surfaceWidth设置为100');
          })

        Button('width = 150')
          .id('xcomponent10_button2')
          .onClick(() => {
            this.surfaceWidth = 150;
            this.updateSurfaceRect();
            console.info('XComponent10: surfaceWidth设置为150');
          })

        Button('width = 200')
          .id('xcomponent10_button3')
          .onClick(() => {
            this.surfaceWidth = 200;
            this.updateSurfaceRect();
            console.info('XComponent10: surfaceWidth设置为200');
          })
      }
      .margin({ top: 10 })

      Row({ space: 10 }) {
        Button('width = 250')
          .id('xcomponent10_button4')
          .onClick(() => {
            this.surfaceWidth = 250;
            this.updateSurfaceRect();
            console.info('XComponent10: surfaceWidth设置为250');
          })

        Button('width = 300')
          .id('xcomponent10_button5')
          .onClick(() => {
            this.surfaceWidth = 300;
            this.updateSurfaceRect();
            console.info('XComponent10: surfaceWidth设置为300');
          })

        Button('width = 350')
          .id('xcomponent10_button6')
          .onClick(() => {
            this.surfaceWidth = 350;
            this.updateSurfaceRect();
            console.info('XComponent10: surfaceWidth设置为350');
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
      surfaceWidth: this.surfaceWidth,
      surfaceHeight: 150
    });
  }
}
