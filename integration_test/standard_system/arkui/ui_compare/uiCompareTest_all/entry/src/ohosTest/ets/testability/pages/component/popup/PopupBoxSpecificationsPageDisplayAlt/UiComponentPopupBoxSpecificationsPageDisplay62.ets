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

import { BusinessError } from '@kit.BasicServicesKit';
import { ImmersiveMode, LevelMode } from '@kit.ArkUI';

@Entry
@Component
struct UiComponentPopupBoxSpecificationsPageDisplay62 {
  @State log: string = 'Log information:';

  build() {
    Column({ space: 20 }) {
      Text('showDialog测试')
        .fontSize(16)
        .fontStyle(FontStyle.Italic)
        .fontWeight(FontWeight.Bolder)
        .fontColor('#666666')
        .textAlign(TextAlign.Center)
        .backgroundColor('#F5F5F5')
        .padding(10)
        .width('90%')

      Button('router跳转')
        .id('UiComponentPopupBoxSpecificationsPageDisplay62_02')
        .fontSize(18)
        .width(200)
        .height(50)
        .type(ButtonType.Capsule)
        .onClick(() => {
          console.log('跳转成功')
          this.getUIContext().getRouter().pushUrl({ url: 'testability/pages/PopupBoxSpecificationsPageDisplay/UiComponentPopupBoxSpecificationsPageDisplayNextPage' });
        })
        .margin({ bottom: 10 })

      Button('showDialog')
        .id('UiComponentPopupBoxSpecificationsPageDisplay62_01')
        .fontSize(18)
        .width(200)
        .height(50)
        .type(ButtonType.Capsule)
        .onClick(() => {
          this.showCustomDialog();
        })

      Text('预期效果：')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .fontStyle(FontStyle.Italic)
        .alignSelf(ItemAlign.Start)
        .margin({ left: 20, top: 20 })

      Text('dialog节点为当前页面顶层，切换界面，弹窗跟随界面消失，重新进入页面(返回跳转)，弹窗仍然存在')
        .fontSize(14)
        .fontStyle(FontStyle.Italic)
        .fontWeight(500)
        .lineHeight(22)
        .backgroundColor('#FFF8DC')
        .padding(15)
        .borderRadius(8)
        .width('90%')
        .fontColor('#DAA520')

      Text('配置说明：')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .fontStyle(FontStyle.Italic)
        .alignSelf(ItemAlign.Start)
        .margin({ left: 20, top: 10 })

      Text('showDialog set\nLevelMode: EMBEDDED\nlevelUniqueId: 正常值\nImmersiveMode: 999 (异常值)\nisModal: false')
        .fontSize(14)
        .fontStyle(FontStyle.Italic)
        .fontWeight(500)
        .lineHeight(22)
        .backgroundColor('#F0F8FF')
        .padding(15)
        .borderRadius(8)
        .width('90%')
        .fontColor('#4169E1')
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }

  showCustomDialog() {
    try {
      const node: FrameNode | null = this.getUIContext().getFrameNodeById('UiComponentPopupBoxSpecificationsPageDisplay62_01') || null;
      this.getUIContext().getPromptAction().showDialog({
        title: '操作确认',
        message: '您确定要执行此操作吗？',
        levelMode: LevelMode.EMBEDDED,
        levelUniqueId: node?.getUniqueId(),
        isModal: false,
        immersiveMode: 999 as ImmersiveMode,
        alignment: DialogAlignment.Bottom,
        buttons: [
          {
            text: '取消',
            color: '#999999'
          },
          {
            text: '确定',
            color: '#007DFF'
          }
        ],
        onWillAppear: () => {
          this.log = 'Log information:#onWillAppear';
          console.info('showDialog,is onWillAppear!');
        },
        onDidAppear: () => {
          this.log += '# onDidAppear';
          console.info('showDialog,is onDidAppear!');
        },
        onWillDisappear: () => {
          this.log += '# onWillDisappear';
          console.info('showDialog,is onWillDisappear!');
        },
        onDidDisappear: () => {
          this.log += '# onDidDisappear';
          console.info('showDialog,is onDidDisappear!');
        }
      })
    } catch (error) {
      let err: BusinessError = error as BusinessError;
      console.error(`捕获到异常: ${err.code}, ${err.message}`);
    }
  }
}

