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
struct XComponent13 {
  xComponentController: XComponentController = new XComponentController();

  build() {
    Column({ space: 20 }) {
      Text('Texture类型 - 不设置surfaceWidth/surfaceHeight测试')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      Text('默认和组件一般大小')
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

      Button('重新设置Surface区域')
        .id('xcomponent13_button1')
        .margin({ top: 20 })
        .onClick(() => {
          this.updateSurfaceRect();
          console.info('XComponent13: 重新设置Surface区域');
        })

    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor(0xF5F5F5)
  }

  private updateSurfaceRect() {
    // 不设置surfaceWidth和surfaceHeight，使用默认值（和组件一般大小）
    // 根据文档，surfaceWidth和surfaceHeight是必填参数，这里设置为组件大小
    this.xComponentController.setXComponentSurfaceRect({
      offsetX: 0,
      offsetY: 0,
      surfaceWidth: 300,  // 组件宽度
      surfaceHeight: 200  // 组件高度
    });
  }
}
