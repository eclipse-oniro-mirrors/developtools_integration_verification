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
struct XComponent09 {
  @State offsetY: number = 0;
  xComponentController: XComponentController = new XComponentController();

  build() {
    Column({ space: 20 }) {
      Text('Texture类型 - 动态设置offsetY测试')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      Text(`当前offsetY: ${this.offsetY}`)
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
        Button('offsetY = 0')
          .id('xcomponent09_button1')
          .onClick(() => {
            this.offsetY = 0;
            this.updateSurfaceRect();
            console.info('XComponent09: offsetY设置为0');
          })

        Button('offsetY = 30')
          .id('xcomponent09_button2')
          .onClick(() => {
            this.offsetY = 30;
            this.updateSurfaceRect();
            console.info('XComponent09: offsetY设置为30');
          })

        Button('offsetY = 60')
          .id('xcomponent09_button3')
          .onClick(() => {
            this.offsetY = 60;
            this.updateSurfaceRect();
            console.info('XComponent09: offsetY设置为60');
          })
      }
      .margin({ top: 10 })

      Row({ space: 10 }) {
        Button('offsetY = 90')
          .id('xcomponent09_button4')
          .onClick(() => {
            this.offsetY = 90;
            this.updateSurfaceRect();
            console.info('XComponent09: offsetY设置为90');
          })

        Button('offsetY = 120')
          .id('xcomponent09_button5')
          .onClick(() => {
            this.offsetY = 120;
            this.updateSurfaceRect();
            console.info('XComponent09: offsetY设置为120');
          })

        Button('offsetY = 150')
          .id('xcomponent09_button6')
          .onClick(() => {
            this.offsetY = 150;
            this.updateSurfaceRect();
            console.info('XComponent09: offsetY设置为150');
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
      offsetY: this.offsetY,
      surfaceWidth: 200,
      surfaceHeight: 100
    });
  }
}
