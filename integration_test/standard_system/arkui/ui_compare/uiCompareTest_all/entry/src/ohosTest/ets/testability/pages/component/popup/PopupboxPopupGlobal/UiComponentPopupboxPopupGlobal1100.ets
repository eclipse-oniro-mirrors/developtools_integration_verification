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
function popupBuilder1(params: Params) {
  Column() {
    Text('Popup 1')
      .fontSize(20)
      .fontWeight(FontWeight.Bold)
      .margin(10)
    Text(params.text)
      .fontSize(16)
      .margin(10)
  }
  .width('100%')
  .height('100%')
  .backgroundColor('#ADd7E6')
  .borderRadius(12)
  .padding(20)
}

@Builder
function popupBuilder2(params: Params) {
  Column() {
    Text('Popup 2')
      .fontSize(20)
      .fontWeight(FontWeight.Bold)
      .margin(10)
    Text(params.text)
      .fontSize(16)
      .margin(10)
  }
  .width('30.56%')
  .height('10.66%')
  .backgroundColor('#90EE90')
  .borderRadius(12)
  .padding(20)
}

@Entry
@Component
struct UiComponentPopupboxPopupGlobal1100 {
  private uiContext: UIContext = this.getUIContext();
  private promptAction: PromptAction = this.uiContext.getPromptAction();
  private promptActionClass1: PromptActionClass = new PromptActionClass();
  private promptActionClass2: PromptActionClass = new PromptActionClass();
  private contentNode1: ComponentContent<Object> | null = null
  private contentNode2: ComponentContent<Object> | null = null

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1100')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })
        .id('title_text_1100')

      Text('测试说明：\n验证多个异步回调同时打开 openPopup（targetinfo 不同）')
        .fontSize(14)
        .margin({ bottom: 20 })
        .padding(10)
        .backgroundColor(Color.Gray)
        .borderRadius(8)

      Button('Test')
        .id('button_test_1100')
        .margin({ bottom: 10 })
        .onClick(() => {
          console.info('Test button clicked')
        })

      Button('跳转')
        .id('button_jump_1100')
        .margin({ bottom: 10 })
        .onClick(() => {
          console.info('Jump button clicked')
        })

      Button('toolItem8')
        .id('button_toolitem8_1100')
        .margin({ bottom: 20 })
        .onClick(() => {
          // 创建两个contentNode，使用不同的targetInfo
          this.contentNode1 = new ComponentContent(this.uiContext, wrapBuilder(popupBuilder1), new Params('Target 1'));
          this.contentNode2 = new ComponentContent(this.uiContext, wrapBuilder(popupBuilder2), new Params('Target 2'));
          
          // 配置第一个popup（targetInfo为target_component1_1100）
          this.promptActionClass1.setPromptAction(this.promptAction);
          this.promptActionClass1.setContentNode(this.contentNode1);
          this.promptActionClass1.setOptions({
            placement: Placement.Bottom,
            enableArrow: true
          });
          this.promptActionClass1.setIsPartialUpdate(false);
          this.promptActionClass1.setTarget({ id: 'target_component1_1100' });
          
          // 配置第二个popup（targetInfo为target_component2_1100）
          this.promptActionClass2.setPromptAction(this.promptAction);
          this.promptActionClass2.setContentNode(this.contentNode2);
          this.promptActionClass2.setOptions({
            placement: Placement.Bottom,
            enableArrow: true
          });
          this.promptActionClass2.setIsPartialUpdate(false);
          this.promptActionClass2.setTarget({ id: 'target_component2_1100' });
          
          // 同时触发两个openPopup
          setTimeout(() => {
            this.promptActionClass1.openPopup();
          }, 50);
          
          setTimeout(() => {
            this.promptActionClass2.openPopup();
          }, 50);
        })

      Row() {
        Column() {
          Text('目标组件1')
            .fontSize(18)
            .margin(10)
        }
        .width('20.83%')
        .height('8.2%')
        .backgroundColor('#FFE0E0FF')
        .borderRadius(8)
        .justifyContent(FlexAlign.Center)
        .id('target_component1_1100')
        .margin({ right: 20 })

        Column() {
          Text('目标组件2')
            .fontSize(18)
            .margin(10)
        }
        .width('20.83%')
        .height('8.2%')
        .backgroundColor('#E0E0FF')
        .borderRadius(8)
        .justifyContent(FlexAlign.Center)
        .id('target_component2_1100')
      }
      .justifyContent(FlexAlign.Center)
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}
