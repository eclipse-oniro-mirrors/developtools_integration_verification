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

import { ComponentContent, PromptAction, TargetInfo } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

export class PromptActionClass {
  private promptAction: PromptAction | null = null;
  private contentNode: ComponentContent<Object> | null = null;
  private options: PopupCommonOptions | null = null;
  private target: TargetInfo | null = null;
  private isPartialUpdate: boolean = false;

  public setPromptAction(promptAction: PromptAction) {
    this.promptAction = promptAction;
  }

  public setContentNode(node: ComponentContent<Object>) {
    this.contentNode = node;
  }

  public setTarget(target: TargetInfo) {
    this.target = target;
  }

  public setOptions(options: PopupCommonOptions) {
    this.options = options;
  }

  public setIsPartialUpdate(isPartialUpdate: boolean) {
    this.isPartialUpdate = isPartialUpdate;
  }

  public openPopup() {
    if (this.promptAction != null && this.contentNode != null) {
      this.promptAction.openPopup(this.contentNode, this.target, this.options)
        .then(() => {
          console.info('openPopup success');
        })
        .catch((err: BusinessError) => {
          console.error('openPopup error: ' + err.code + ' ' + err.message);
        })
    }
  }

  public closePopup() {
    if (this.promptAction != null && this.contentNode != null) {
      this.promptAction.closePopup(this.contentNode)
        .then(() => {
          console.info('closePopup success');
        })
        .catch((err: BusinessError) => {
          console.error('closePopup error: ' + err.code + ' ' + err.message);
        })
    }
  }

  public updatePopup(options: PopupCommonOptions) {
    if (this.promptAction != null && this.contentNode != null) {
      this.promptAction.updatePopup(this.contentNode, options, this.isPartialUpdate)
        .then(() => {
          console.info('updatePopup success');
        })
        .catch((err: BusinessError) => {
          console.error('updatePopup error: ' + err.code + ' ' + err.message);
        })
    }
  }
}

class Params {
  public text: string = '';

  constructor(text: string) {
    this.text = text;
  }
}

@Builder
function popupBuilder(params: Params) {
  Column() {
    Text('命令式 Popup')
      .fontSize(20)
      .fontWeight(FontWeight.Bold)
      .margin(10)
    Text(params.text)
      .fontSize(16)
      .margin(10)
  }
  .width('100%')
  .height('100%')
  .backgroundColor('#FFE0E0')
  .borderRadius(12)
  .padding(20)
}

@Entry
@Component
struct UiComponentPopupboxPopupGlobal1080 {
  private uiContext: UIContext = this.getUIContext();
  private promptAction: PromptAction = this.uiContext.getPromptAction();
  private promptActionClass: PromptActionClass = new PromptActionClass();
  private contentNode: ComponentContent<Object> | null = null

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1080')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })
        .id('title_text_1080')

      Text('测试说明：\n验证多个异步回调同时关闭 closePopup（targetinfo 相同）')
        .fontSize(14)
        .margin({ bottom: 20 })
        .padding(10)
        .backgroundColor(Color.Gray)
        .borderRadius(8)

      Button('Test')
        .id('button_test_1080')
        .margin({ bottom: 10 })
        .onClick(() => {
          console.info('Test button clicked')
        })

      Button('跳转')
        .id('button_jump_1080')
        .margin({ bottom: 10 })
        .onClick(() => {
          console.info('Jump button clicked')
        })

      Button('toolItem8')
        .id('button_toolitem8_1080')
        .margin({ bottom: 20 })
        .onClick(() => {
          this.contentNode = new ComponentContent(this.uiContext, wrapBuilder(popupBuilder), new Params('相同targetInfo关闭测试'));
          
          this.promptActionClass.setPromptAction(this.promptAction);
          this.promptActionClass.setContentNode(this.contentNode);
          this.promptActionClass.setOptions({
            placement: Placement.Bottom,
            enableArrow: true,
            popupColor: '#FFE0E0'
          });
          this.promptActionClass.setIsPartialUpdate(false);
          this.promptActionClass.setTarget({ id: 'target_component_1080' });
          this.promptActionClass.openPopup();
          
          // 2秒后更新颜色
          setTimeout(() => {
            this.promptActionClass.updatePopup({
              placement: Placement.Top,
              enableArrow: true,
              popupColor: '#ADd7E6'
            });
          }, 2000);
          
          // 6秒后更新颜色
          setTimeout(() => {
            this.promptActionClass.updatePopup({
              placement: Placement.Bottom,
              enableArrow: true,
              popupColor: '#90EE90'
            });
          }, 6000);
          
          // 8秒后同时触发多个closePopup
          setTimeout(() => {
            setTimeout(() => {
              this.promptActionClass.closePopup();
            }, 50);
            
            setTimeout(() => {
              this.promptActionClass.closePopup();
            }, 50);
          }, 8000);
        })

      Column() {
        Text('目标组件')
          .fontSize(18)
          .margin(10)
      }
      .width('20.83%')
      .height('8.2%')
      .backgroundColor('#FFE0E0FF')
      .borderRadius(8)
      .justifyContent(FlexAlign.Center)
      .id('target_component_1080')
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}
