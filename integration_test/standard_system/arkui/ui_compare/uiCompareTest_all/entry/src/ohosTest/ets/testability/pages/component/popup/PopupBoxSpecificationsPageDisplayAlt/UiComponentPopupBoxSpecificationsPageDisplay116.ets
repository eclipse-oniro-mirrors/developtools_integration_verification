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
struct UiComponentPopupBoxSpecificationsPageDisplay116 {
  private uiContext: UIContext = this.getUIContext();
  @State maskX: number|string = 0;
  @State maskY: number|string = 0;

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

      Button('100%mask')
        .id('UiComponentPopupBoxSpecificationsPageDisplay116_03')
        .fontSize(18)
        .width(200)
        .height(50)
        .type(ButtonType.Capsule)
        .onClick(() => {
          this.maskX = '100%'
          this.maskY = '100%'
          console.log('设置100%mask成功')
        })

      Button('返回首页')
        .id('UiComponentPopupBoxSpecificationsPageDisplay116_01')
        .fontSize(18)
        .type(ButtonType.Capsule)
        .width(200)
        .height(50)
        .onClick(() => {
          this.uiContext.getRouter().pushUrl({ url: 'testability/pages/PopupBoxSpecificationsPageDisplay/UiComponentPopupBoxSpecificationsPageDisplayNextPage' });
        })

      Button('ShowActionSheet')
        .id('UiComponentPopupBoxSpecificationsPageDisplay116_02')
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
          const node: FrameNode | null = this.getUIContext().getFrameNodeById('UiComponentPopupBoxSpecificationsPageDisplay116_02') || null;
          try {
            this.getUIContext().showActionSheet({
              maskRect: { x: 0, y: 0, width: '100%', height: '100%' },
              levelMode: LevelMode.EMBEDDED,
              levelUniqueId: node?.getUniqueId(),
              immersiveMode: ImmersiveMode.DEFAULT,
              isModal: false,
              showInSubWindow:true,
              autoCancel:true,
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
              onDidAppear: () => {
                console.info('showActionSheet,is onDidAppear!');
              },
              onDidDisappear: () => {
                console.info('showActionSheet,is onDidDisappear!');
              },
              onWillAppear: () => {
                console.info('showActionSheet,is onWillAppear!');
              },
              onWillDisappear: () => {
                console.info('showActionSheet,is onWillDisappear!');
              },
              alignment: DialogAlignment.Bottom,
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
        .fontStyle(FontStyle.Italic)
        .alignSelf(ItemAlign.Start)
        .margin({ left: 20, top: 20 })

      Text('EMBEDDED 只在非子窗上显示，设置 showInSubWindow 为 true 后不生效，弹窗显示在全局窗口顶层。切换界面，弹窗跟随在新的页面中显示，左滑或者点击空白，弹窗退出')
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

      Text('ShowActionSheet set\nLevelMode: EMBEDDED\nlevelUniqueId: 正常值\nImmersiveMode: DEFAULT\nshowInSubWindow: true\nisModal: false')
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
}
