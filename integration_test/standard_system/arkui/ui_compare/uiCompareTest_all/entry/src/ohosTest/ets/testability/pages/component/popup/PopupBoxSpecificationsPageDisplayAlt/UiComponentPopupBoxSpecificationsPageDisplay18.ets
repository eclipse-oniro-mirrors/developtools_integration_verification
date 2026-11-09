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

import { promptAction, LevelMode, ImmersiveMode } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct UiComponentPopupBoxSpecificationsPageDisplay18 {
  private uiContext: UIContext = this.getUIContext();

  build() {
    Column({ space: 20 }) {
      Text('ShowActionSheet测试')
        .fontSize(16)
        .fontStyle(FontStyle.Italic)
        .fontWeight(FontWeight.Bolder)
        .fontColor('#666666')
        .textAlign(TextAlign.Center)
        .backgroundColor('#F5F5F5')
        .padding(10)
        .width('90%')

      Button('返回首页')
        .id('UiComponentPopupBoxSpecificationsPageDisplay18_01')
        .fontSize(18)
        .type(ButtonType.Capsule)
        .width(200)
        .height(50)
        .onClick(() => {
          this.uiContext.getRouter().pushUrl({ url: 'testability/pages/PopupBoxSpecificationsPageDisplay/UiComponentPopupBoxSpecificationsPageDisplayNextPage' });
        })

      Button('ShowActionSheet')
        .id('UiComponentPopupBoxSpecificationsPageDisplay18_02')
        .fontSize(18)
        .width(200)
        .height(50)
        .labelStyle({ overflow: TextOverflow.Clip,
          maxLines: 1,
          minFontSize: 20,
          maxFontSize: 20,
          font: {
            size: 20,
            weight: FontWeight.Bolder,
            family: 'cursive',
            style: FontStyle.Italic
          }
        })
        .type(ButtonType.Capsule)
        .onClick(() => {
          console.log('打开ActionSheet成功')
          try {
            const node: FrameNode | null = this.uiContext.getFrameNodeById('UiComponentPopupBoxSpecificationsPageDisplay18_02') || null;
            this.getUIContext().showActionSheet({
              levelMode: LevelMode.EMBEDDED, // 正常值
              levelUniqueId: node?.getUniqueId(), // 正常值
              immersiveMode: 666 as ImmersiveMode, // 异常值
              isModal:false,
              title: 'ActionSheet title',
              subtitle: 'ActionSheet subtitle',
              message: 'message',
              confirm: {
                defaultFocus: true,
                value: 'Confirm button',
                action: () => {
                  console.info('Get ActionSheet handled');
                }
              },
              cancel: () => {
                console.info('ActionSheet canceled');
              },
              onWillDismiss: (dismissDialogAction: DismissDialogAction) => {
                console.info(`reason= ${dismissDialogAction.reason}`);
                console.info('ActionSheet onWillDismiss');
                if (dismissDialogAction.reason === DismissReason.PRESS_BACK) {
                  dismissDialogAction.dismiss();
                }
                if (dismissDialogAction.reason === DismissReason.TOUCH_OUTSIDE) {
                  dismissDialogAction.dismiss();
                }
              },
              alignment: DialogAlignment.Bottom,
              offset: { dx: 0, dy: -10 },
              sheets: [
                {
                  title: '选项1',
                  action: () => {
                    console.log('选择了选项1')
                  }
                },
                {
                  title: '选项2',
                  action: () => {
                    console.log('选择了选项2')
                  }
                },
                {
                  title: '选项3',
                  action: () => {
                    console.log('选择了选项3')
                  }
                }
              ]
            })
            console.log('ActionSheet显示成功')
          } catch (error) {
            console.error(`showActionSheet error: ${(error as BusinessError).code}, ${(error as BusinessError).message}`);
          }
        })

      Text('预期效果：')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)
        .margin({ left: 20, top: 20 })

      Text('• ActionSheet节点为全局窗口顶层\n• 弹窗显示在全局层级\n• 可正常选择选项\n• 点击"返回首页跳转"可跳转页面')
        .fontSize(14)
        .lineHeight(22)
        .backgroundColor('#FFF8DC')
        .padding(15)
        .borderRadius(8)
        .width('90%')
        .fontColor('#DAA520')
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}
