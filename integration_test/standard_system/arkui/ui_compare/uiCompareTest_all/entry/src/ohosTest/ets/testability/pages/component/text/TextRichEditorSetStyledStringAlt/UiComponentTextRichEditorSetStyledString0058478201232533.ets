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

import { LengthMetrics } from '@kit.ArkUI';

@Entry
@Component
struct UiComponentTextRichEditorSetStyledString0058478201232533 {
  controller: RichEditorStyledStringController = new RichEditorStyledStringController();
  controller2: RichEditorStyledStringController = new RichEditorStyledStringController();
  options: RichEditorStyledStringOptions = { controller: this.controller };
  options2: RichEditorStyledStringOptions = { controller: this.controller2 };
  mutableStr: MutableStyledString = new MutableStyledString('请选中此文本查看自定义菜单\n您可以长按文本弹出编辑菜单');
  mutableStr2: MutableStyledString = new MutableStyledString('');

  aboutToAppear() {
    // 设置属性字符串样式
    let textStyle = new TextStyle({
      fontColor: Color.Black,
      fontSize: LengthMetrics.vp(18)
    });
    this.mutableStr.setStyle({
      start: 0,
      length: this.mutableStr.length,
      styledKey: StyledStringKey.FONT,
      styledValue: textStyle
    });

    this.controller.setStyledString(this.mutableStr);

    // 创建辅助说明的属性字符串
    this.mutableStr2.appendStyledString(new StyledString('长按或选中文本查看自定义菜单'));
    
    let grayStyle = new TextStyle({ fontColor: Color.Gray, fontSize: LengthMetrics.vp(14) });
    this.mutableStr2.setStyle({ start: 0, length: this.mutableStr2.length, styledKey: StyledStringKey.FONT, styledValue: grayStyle });
    
    this.controller2.setStyledString(this.mutableStr2);
  }

  build() {
    Column({ space: 10 }) {
      Text('验证属性字符串构建的RichEditor组件支持editMenuOptions')
        .fontSize(13)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10 })

      RichEditor(this.options2)
        .id('rich_editor_setstyledstring_0058_478_201_232_533_info')
        .width('100%')
        .height(120)
        .backgroundColor('#FFF9E6')
        .border({ width: 1, color: Color.Orange })
        .borderRadius(8)
        .padding(8)

      Button('重置说明')
        .id('button_setstyledstring_0058_478_201_232_533_reset')
        .fontSize(14)
        .width('90%')
        .onClick(() => {
          this.mutableStr2 = new MutableStyledString('');
          this.mutableStr2.appendStyledString(new StyledString('长按或选中文本查看自定义菜单'));
          
          let grayStyle = new TextStyle({ fontColor: Color.Gray, fontSize: LengthMetrics.vp(14) });
          this.mutableStr2.setStyle({ start: 0, length: this.mutableStr2.length, styledKey: StyledStringKey.FONT, styledValue: grayStyle });
          
          this.controller2.setStyledString(this.mutableStr2);
        })

      RichEditor(this.options)
        .id('rich_editor_setstyledstring_0058_478_201_232_533')
        .width('100%')
        .height(250)
        .backgroundColor(Color.White)
        .border({ width: 2, color: Color.Blue })
        .borderRadius(8)
        .padding(10)
        .editMenuOptions({
          onCreateMenu: (menuItems: TextMenuItem[]) => {
            // 在系统菜单基础上添加多个自定义扩展项
            menuItems.push({
              content: '自定义菜单项1'
            } as TextMenuItem);
            menuItems.push({
              content: '自定义菜单项2'
            } as TextMenuItem);
            menuItems.push({
              content: '自定义菜单项3'
            } as TextMenuItem);
            menuItems.push({
              content: '自定义菜单项4'
            } as TextMenuItem);
            
            return menuItems;
          },
          onMenuItemClick: (menuItem: TextMenuItem, textRange: TextRange): boolean => {
            // 验证点击的是自定义菜单项
            if (menuItem.content === '自定义菜单项1' || 
                menuItem.content === '自定义菜单项2' || 
                menuItem.content === '自定义菜单项3' || 
                menuItem.content === '自定义菜单项4') {
              // 显示点击结果
              this.mutableStr2 = new MutableStyledString('');
              this.mutableStr2.appendStyledString(new StyledString('点击了：' + menuItem.content));
              
              let textStyle = new TextStyle({ fontColor: Color.Black, fontSize: LengthMetrics.vp(14) });
              this.mutableStr2.setStyle({ start: 0, length: this.mutableStr2.length, styledKey: StyledStringKey.FONT, styledValue: textStyle });
              
              this.controller2.setStyledString(this.mutableStr2);
              return true;
            }
            return false;
          }
        })
    }
    .width('100%')
    .height('100%')
    .padding(15)
    .backgroundColor('#F6F7F9')
  }
}

