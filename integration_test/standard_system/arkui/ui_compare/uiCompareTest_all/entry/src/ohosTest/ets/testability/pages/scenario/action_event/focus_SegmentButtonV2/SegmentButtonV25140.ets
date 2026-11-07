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

import { TabSegmentButtonV2, SegmentButtonV2Items, promptAction } from '@kit.ArkUI';


@Entry
@ComponentV2
struct SegmentButtonV25140 {
  @Local selectedIndex: number = 0;
  @Local buttonItems: SegmentButtonV2Items = new SegmentButtonV2Items([
    { text: '放大镜', icon: $r('app.media.icon') },
    { text: '扫一扫', icon: $r('app.media.icon') },
    { text: '分享', icon: $r('app.media.icon') }
  ]);

  build() {
    Row() {
      Column() {
        Text('SegmentButtonV2 - 图文混排测试')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })

        Text('TabSegmentButtonV2 页签型分段按钮')
          .fontSize(14)
          .fontColor('#666666')
          .margin({ bottom: 20 })

        TabSegmentButtonV2({
          items: this.buttonItems,
          selectedIndex: this.selectedIndex,
          onItemClicked: (index: number) => {
            this.selectedIndex = index;
            promptAction.showToast({
              message: `点击了第${index}个选项`,
              duration: 2000
            });
          }
        })
          .id('segmentButton')
          .width('100%')
          .margin({ bottom: 30 })

        Text('参数配置')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })
          .width('100%')

        Button('图文混合')
          .id('searchButton')
          .width('90%')
          .height(40)
          .margin({ bottom: 10 })
          .onClick(() => {
            // 接口已启用
          })

        Button('重置')
          .id('resetButton')
          .width('80%')
          .height(40)
          .margin({ bottom: 20 })
          .onClick(() => {
            this.selectedIndex = 0;
          })

        Text('预期：点击这三个图标：放大镜、扫一扫、分享。分别提示第0、1、2个选项被点击。分段按钮正常切换，样式符合UX规范')
          .fontSize(14)
          .fontColor('#FF6600')
          .fontWeight(FontWeight.Bold)
          .margin({ top: 10 })
          .width('100%')
      }
      .width('100%')
      .padding(16)
    }
    .height('100%')
  }
}
