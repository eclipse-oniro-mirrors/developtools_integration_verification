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
struct XComponent08 {
  @State offsetX: number = 0;
  xComponentController: XComponentController = new XComponentController();

  build() {
    Column({ space: 20 }) {
      Text('Texture类型 - 动态设置offsetX测试')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      Text(`当前offsetX: ${this.offsetX}`)
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
        Button('offsetX = 0')
          .id('xcomponent08_button1')
          .onClick(() => {
            this.offsetX = 0;
            this.updateSurfaceRect();
            console.info('XComponent08: offsetX设置为0');
          })

        Button('offsetX = 50')
          .id('xcomponent08_button2')
          .onClick(() => {
            this.offsetX = 50;
            this.updateSurfaceRect();
            console.info('XComponent08: offsetX设置为50');
          })

        Button('offsetX = 100')
          .id('xcomponent08_button3')
          .onClick(() => {
            this.offsetX = 100;
            this.updateSurfaceRect();
            console.info('XComponent08: offsetX设置为100');
          })
      }
      .margin({ top: 10 })

      Row({ space: 10 }) {
        Button('offsetX = 150')
          .id('xcomponent08_button4')
          .onClick(() => {
            this.offsetX = 150;
            this.updateSurfaceRect();
            console.info('XComponent08: offsetX设置为150');
          })

        Button('offsetX = 200')
          .id('xcomponent08_button5')
          .onClick(() => {
            this.offsetX = 200;
            this.updateSurfaceRect();
            console.info('XComponent08: offsetX设置为200');
          })

        Button('offsetX = 250')
          .id('xcomponent08_button6')
          .onClick(() => {
            this.offsetX = 250;
            this.updateSurfaceRect();
            console.info('XComponent08: offsetX设置为250');
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
      offsetX: this.offsetX,
      offsetY: 0,
      surfaceWidth: 200,
      surfaceHeight: 150
    });
  }
}
