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
struct XComponent07 {
  @State surfaceWidth: number = 200;
  @State surfaceHeight: number = 150;
  xComponentController: XComponentController = new XComponentController();

  build() {
    Column({ space: 20 }) {
      Text('Surface类型 - 异常值测试')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      Text(`当前surfaceWidth: ${this.surfaceWidth}, surfaceHeight: ${this.surfaceHeight}`)
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
        Button('width = 0')
          .id('xcomponent07_button1')
          .onClick(() => {
            this.surfaceWidth = 0;
            this.updateSurfaceRect();
            console.info('XComponent07: surfaceWidth设置为0');
          })

        Button('width = -50')
          .id('xcomponent07_button2')
          .onClick(() => {
            this.surfaceWidth = -50;
            this.updateSurfaceRect();
            console.info('XComponent07: surfaceWidth设置为-50');
          })

        Button('width = 9000')
          .id('xcomponent07_button3')
          .onClick(() => {
            this.surfaceWidth = 9000;
            this.updateSurfaceRect();
            console.info('XComponent07: surfaceWidth设置为9000');
          })
      }
      .margin({ top: 10 })

      Row({ space: 10 }) {
        Button('height = 0')
          .id('xcomponent07_button4')
          .onClick(() => {
            this.surfaceHeight = 0;
            this.updateSurfaceRect();
            console.info('XComponent07: surfaceHeight设置为0');
          })

        Button('height = -30')
          .id('xcomponent07_button5')
          .onClick(() => {
            this.surfaceHeight = -30;
            this.updateSurfaceRect();
            console.info('XComponent07: surfaceHeight设置为-30');
          })

        Button('height = 9000')
          .id('xcomponent07_button6')
          .onClick(() => {
            this.surfaceHeight = 9000;
            this.updateSurfaceRect();
            console.info('XComponent07: surfaceHeight设置为9000');
          })
      }

      Button('恢复正常值')
        .id('xcomponent07_button7')
        .margin({ top: 10 })
        .onClick(() => {
          this.surfaceWidth = 200;
          this.surfaceHeight = 150;
          this.updateSurfaceRect();
          console.info('XComponent07: 恢复正常值');
        })

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
      surfaceHeight: this.surfaceHeight
    });
  }
}
