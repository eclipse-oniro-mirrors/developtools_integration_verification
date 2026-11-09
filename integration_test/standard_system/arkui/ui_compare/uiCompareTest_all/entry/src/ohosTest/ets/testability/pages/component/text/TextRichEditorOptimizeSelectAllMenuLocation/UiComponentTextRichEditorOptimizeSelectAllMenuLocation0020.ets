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

// 自定义接口
export interface SelectionMenuTheme {
  imageSize: number;
  buttonSize: number;
  menuSpacing: number;
  editorOptionMargin: number;
  expandedOptionPadding: number;
  defaultMenuWidth: number;
  imageFillColor: Resource;
  backGroundColor: Resource;
  iconBorderRadius: Resource;
  containerBorderRadius: Resource;
  cutIcon: Resource;
  copyIcon: Resource;
  pasteIcon: Resource;
  selectAllIcon: Resource;
  shareIcon: Resource;
  translateIcon: Resource;
  searchIcon: Resource;
  arrowDownIcon: Resource;
  iconPanelShadowStyle: ShadowStyle;
  iconFocusBorderColor: Resource;
}

// 自定义变量
export const defaultTheme: SelectionMenuTheme = {
  imageSize: 24,
  buttonSize: 48,
  menuSpacing: 8,
  editorOptionMargin: 1,
  expandedOptionPadding: 3,
  defaultMenuWidth: 256,
  imageFillColor: $r('sys.color.ohos_id_color_primary'),
  backGroundColor: $r('sys.color.ohos_id_color_dialog_bg'),
  iconBorderRadius: $r('sys.float.ohos_id_corner_radius_default_m'),
  containerBorderRadius: $r('sys.float.ohos_id_corner_radius_card'),
  cutIcon: $r('sys.media.ohos_ic_public_cut'),
  copyIcon: $r('sys.media.ohos_ic_public_copy'),
  pasteIcon: $r('sys.media.ohos_ic_public_paste'),
  selectAllIcon: $r('sys.media.ohos_ic_public_select_all'),
  shareIcon: $r('sys.media.ohos_ic_public_share'),
  translateIcon: $r('sys.media.ohos_ic_public_translate_c2e'),
  searchIcon: $r('sys.media.ohos_ic_public_search_filled'),
  arrowDownIcon: $r('sys.media.ohos_ic_public_arrow_down'),
  iconPanelShadowStyle: ShadowStyle.OUTER_DEFAULT_MD,
  iconFocusBorderColor: $r('sys.color.ohos_id_color_focused_outline'),
}


@Entry
@Component
struct UIComponentTextRichEditorOptimizeSelectAllMenuLocation0020 {
  // 创建RichEditor控制器
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
  infoShowController: RichEditorController = new RichEditorController();
  infoShowOptions: RichEditorOptions = { controller: this.infoShowController };
  // 补充：主题变量（SystemMenu中需要用到this.theme）
  theme: SelectionMenuTheme = defaultTheme;
  // 补充：滑块显示状态（bindSelectionMenu的回调中用到）
  @State sliderShow: boolean = false;
  // 支持颜色模式切换
  @StorageProp('currentColorMode') @Watch('onColorModeChange') currentMode: number =
    ConfigurationConstant.ColorMode.COLOR_MODE_LIGHT;
  @State currentBackgroundColor: ResourceStr = $r('sys.color.brand');
  // 支持键盘避让
  @State supportAvoidance: boolean = true;

  // 打开页面时初始资源
  aboutToAppear(): void {
    if (this.currentMode == ConfigurationConstant.ColorMode.COLOR_MODE_LIGHT) {
      // 浅色模式资源初始化
      this.currentBackgroundColor = $r('sys.color.brand')
    } else {
      // 浅色模式资源初始化
      this.currentBackgroundColor = $r('sys.color.warning');
    }
  }

  // 切换颜色模式
  onColorModeChange(): void {
    if (this.currentMode === ConfigurationConstant.ColorMode.COLOR_MODE_LIGHT) {
      this.currentBackgroundColor = $r('sys.color.brand')
    } else {
      this.currentBackgroundColor = $r('sys.color.warning');
    }
  }

  // 自定义选择菜单的构建方法
  @Builder
  SystemMenu() {
    Column() {
      Menu() {
        if (this.controller) {
          MenuItemGroup() {
            MenuItem({
              startIcon: this.theme.cutIcon,
              content: '剪切',
              labelInfo: 'Ctrl+X'
            })
            MenuItem({
              startIcon: this.theme.copyIcon,
              content: '复制',
              labelInfo: 'Ctrl+C'
            })
            MenuItem({
              startIcon: this.theme.pasteIcon,
              content: '粘贴',
              labelInfo: 'Ctrl+V'
            })
          }
        }
      }
      .radius(this.theme.containerBorderRadius)
      .clip(true)
      .backgroundColor(Color.White)
      .width(this.theme.defaultMenuWidth)
    }
    .width(this.theme.defaultMenuWidth)
  }

  build() {

    Column() {
      // RichEditor 组件
      Row() {
        RichEditor(this.options)
          .onReady(() => {
            this.controller.addTextSpan(' ', {
              style: {
                fontColor: Color.Black,
                fontSize: 15
              }
            })
          })
          .id('rich_editor_optimizeselectallmenulocation_0020')
          .width(300)
          .height(300)
          .backgroundColor(Color.White)
          .border({
            width: 2,
            color: this.currentBackgroundColor
          })
          .onReady(() => {
            this.controller.addTextSpan('组件设置了自定义菜单，长按可触发。', {
              style: {
                fontColor: Color.Black,
                fontSize: 18
              }
            })
          })
          .bindSelectionMenu(RichEditorSpanType.TEXT, this.SystemMenu, ResponseType.LongPress, {
            onDisappear: () => {
              this.sliderShow = false
            }
          })
      }

      Row() {
        Row() {
          Button('添加图片', { type: ButtonType.Normal, stateEffect: true })
            .id('button_optimizeselectallmenulocation_0020_addImage')
            .borderRadius(8)
            .width(120)
            .height(40)
            .margin(10)
            .onClick(() => {
              this.controller.addImageSpan($r('sys.media.ohos_app_icon'), {
                imageStyle: {
                  size: ['57px', '57px']
                }
              })
            })
        }
        .backgroundColor('app.color.Pink')

        Row() {
          Button('添加symbol', { type: ButtonType.Normal, stateEffect: true })
            .id('button_optimizeselectallmenulocation_0020_symbol')
            .borderRadius(8)
            .width(120)
            .height(40)
            .margin(10)
            .onClick(() => {
              this.controller.addSymbolSpan($r('sys.symbol.basketball_fill'), {
                style: {
                  fontSize: 30,
                }
              })
            })
        }
      }

    }
    .width('100%')
    .height('100%')
  }
}