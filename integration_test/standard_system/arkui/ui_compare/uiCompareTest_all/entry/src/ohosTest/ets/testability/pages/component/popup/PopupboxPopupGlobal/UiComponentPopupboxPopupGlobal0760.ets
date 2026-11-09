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

import { ComponentContent, FrameNode, PromptAction, TargetInfo } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

class PromptActionClass {
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
    if (this.promptAction != null && this.contentNode != null && this.target != null && this.options != null) {
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
  promptActionClass: PromptActionClass = new PromptActionClass();

  constructor(promptActionClass: PromptActionClass) {
    this.promptActionClass = promptActionClass;
  }
}

@Builder
function popupBuilder(params: Params) {
  Column() {
    Text('Popup 内容')
      .fontSize(20)
      .fontWeight(FontWeight.Bold)
      .margin(10)
    Text('测试 offset 参数')
      .fontSize(16)
      .margin(10)
    Text('partialUpdate 为 false，更新不生效')
      .fontSize(12)
      .fontColor(Color.Gray)
      .margin({ top: 10 })
    
    Button('跳转')
      .id('button_jump_0760')
      .margin({ top: 10 })
      .width(100)
      .onClick(() => {
        console.info('Jump button clicked');
      })
    
    Button('update 更新')
      .id('button_update_0760')
      .margin({ top: 10 })
      .width(100)
      .onClick(() => {
        params.promptActionClass.updatePopup({
          offset: { x: 100, y: 100 }
        });
      })
  }
  .width('100%')
  .height('100%')
  .backgroundColor(Color.White)
  .borderRadius(12)
  .padding(20)
}

@Entry
@Component
struct UiComponentPopupboxPopupGlobal0760 {
  private uiContext: UIContext = this.getUIContext();
  private promptAction: PromptAction = this.uiContext.getPromptAction();
  private promptActionClass: PromptActionClass = new PromptActionClass();
  private targetId: number = 0;
  private contentNode: ComponentContent<Object> =
    new ComponentContent(this.uiContext, wrapBuilder(popupBuilder), new Params(this.promptActionClass));
  private options: PopupCommonOptions = { 
    placement: Placement.Bottom,
    enableArrow: true
  };

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0760')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })
        .id('title_text_0760')

      Text('测试说明：\n验证 updatePopup 接口 options 设置 offset 参数 x 和 y 为 null 时，后修改为 100（partialUpdate 为 false）')
        .fontSize(14)
        .margin({ bottom: 30 })
        .padding(10)
        .backgroundColor(Color.Gray)
        .borderRadius(8)

      Button('Test')
        .id('button_test_0760')
        .margin({ bottom: 10 })
        .onClick(() => {
          let frameNode: FrameNode | null = this.uiContext.getFrameNodeById('target_component_0760');
          let targetId = frameNode?.getUniqueId() || 0;
          this.targetId = targetId;
          
          this.promptActionClass.setPromptAction(this.promptAction);
          this.promptActionClass.setContentNode(this.contentNode);
          this.promptActionClass.setOptions(this.options);
          this.promptActionClass.setIsPartialUpdate(false);
          this.promptActionClass.setTarget({ id: this.targetId });
          this.promptActionClass.openPopup();
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
      .id('target_component_0760')
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}
