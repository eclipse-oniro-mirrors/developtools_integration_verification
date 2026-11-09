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

import { ConfigurationConstant, } from '@kit.AbilityKit';
import { KeyboardAvoidMode } from '@kit.ArkUI';

@Entry
@Component
struct UiComponentTextRichEditorAvoidCursor0013 {
  // 创建RichEditor控制器
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
  infoShowController: RichEditorController = new RichEditorController();
  infoShowOptions: RichEditorOptions = { controller: this.infoShowController };
  // 属性字符串controller
  controllerStyled: RichEditorStyledStringController = new RichEditorStyledStringController();
  // 支持颜色模式切换
  @StorageProp('currentColorMode') @Watch('onColorModeChange') currentMode: number =
    ConfigurationConstant.ColorMode.COLOR_MODE_LIGHT;
  @State currentBackgroundColor: ResourceStr = $r('sys.color.brand');
  // 支持键盘避让
  @State supportAvoidance: boolean = true;
  // 光标位置测试
  @State caretPosition: number = 0;
  @State maxCaretPosition: number = 0;

  // 打开页面时初始资源
  aboutToAppear(): void {
    if (this.currentMode == ConfigurationConstant.ColorMode.COLOR_MODE_LIGHT) {
      // 浅色模式资源初始化
      this.currentBackgroundColor = $r('sys.color.brand')
    } else {
      // 浅色模式资源初始化
      this.currentBackgroundColor = $r('sys.color.warning');
    }
    
    // 设置键盘避让模式
    let uiContext = this.getUIContext();
    uiContext.setKeyboardAvoidMode(KeyboardAvoidMode.RESIZE_WITH_CARET);
  }

  // 切换颜色模式
  onColorModeChange(): void {
    if (this.currentMode === ConfigurationConstant.ColorMode.COLOR_MODE_LIGHT) {
      this.currentBackgroundColor = $r('sys.color.brand')
    } else {
      this.currentBackgroundColor = $r('sys.color.warning');
    }
  }

  // 定义字体样式对象
  fontStyle: TextStyle = new TextStyle({
    fontColor: Color.Pink
  });

  // 创建属性字符串
  mutableStyledString: MutableStyledString = new MutableStyledString('创建使用属性字符串构建的RichEditor组件。',
    [{
      start: 0,
      length: 5,
      styledKey: StyledStringKey.FONT,
      styledValue: this.fontStyle
    }]);




  build() {
    Scroll() {
      Column() {

        Row() {
          Button('CaretPosition++: ' + this.caretPosition)
            .onClick(() => {
              if (this.caretPosition < this.maxCaretPosition) {
                this.caretPosition += 1;
              }
            })
            .id('button_avoidcursor_0013_caretPositionAdd')
            .fontSize(10)

          Button('CaretPosition--: ' + this.caretPosition)
            .onClick(() => {
              if (this.caretPosition > 0) {
                this.caretPosition -= 1;
              }
            })
            .id('button_avoidcursor_0013_caretPositionReduce')
            .fontSize(10)

          Button('SetCaretPosition: ')
            .onClick(() => {
              this.controller.setCaretOffset(this.caretPosition);
            })
            .id('button_avoidcursor_0013_setCaretPosition')
            .fontSize(10)
        }

        RichEditor(this.options)
          .id('rich_editor_avoidcursor_0013')
          .width('100%')
          .height(200)
          .backgroundColor(Color.White)
          .border({
            width: 2,
            color: this.currentBackgroundColor
          })
          .onReady(() => {
            const testText = 'Most of us compare ourselves with anyone we think is happier — a relative, someone we know a lot, or someone we hardly know. As a result, what we do remember is anything that makes others happy, anything that makes ourselves unhappy, totally forgetting that there is something happy in our own life. So the best way to destroy happiness is to look at something and focus on even the smallest flaw. It is the smallest flaw that would make us complain. And it is the complaint that leads to us becoming unhappy. If one chooses to be happy, he will be blessed; if he chooses to be unhappy, he will be cursed. Happiness is just what you think will make you happy.';
            this.controller.addTextSpan(testText, {
              style: {
                fontColor: $r('sys.color.ohos_id_color_text_primary'),
                fontSize: 20
              }
            });
            this.maxCaretPosition = testText.length;
          })
          .onFocus(() => {
            console.log('RichEditor获得焦点，键盘即将弹出');
          })
          .onBlur(() => {
            console.log('RichEditor失去焦点，键盘即将收起');
          })
      }
      .width('100%')
      .height('100%')

    }
  }
}