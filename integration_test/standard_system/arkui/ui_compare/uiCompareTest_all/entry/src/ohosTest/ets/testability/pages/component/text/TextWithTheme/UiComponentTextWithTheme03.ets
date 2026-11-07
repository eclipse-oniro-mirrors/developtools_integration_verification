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

import { CustomTheme, CustomColors, ThemeControl } from '@kit.ArkUI';

class GreenColors implements CustomColors {
  fontPrimary = '#ff049404';
  fontEmphasize = '#FF00541F';
  fontOnPrimary = '#FFFFFFFF';
  compBackgroundTertiary = '#1111FF11';
  backgroundEmphasize = '#FF00541F';
  compEmphasizeSecondary = '#3322FF22';
}

class RedColors implements CustomColors {
  fontPrimary = '#fff32b3c';
  fontEmphasize = '#FFD53032';
  fontOnPrimary = '#FFFFFFFF';
  compBackgroundTertiary = '#44FF2222';
  backgroundEmphasize = '#FFD00000';
  compEmphasizeSecondary = '#33FF1111';
}

class BlueColors implements CustomColors {
  fontPrimary = Color.Blue;
  backgroundPrimary = Color.Blue;
  brand = Color.Blue;
}

class PageCustomTheme implements CustomTheme {
  colors?: CustomColors

  constructor(colors: CustomColors) {
    this.colors = colors
  }
}
const BlueColorsTheme = new PageCustomTheme(new BlueColors());
ThemeControl.setDefaultTheme(BlueColorsTheme);
@Entry
@Component
struct UiComponentTextWithTheme03 {
  controller: TextInputController = new TextInputController()
  static readonly themeCount = 3;
  themeNames: string[] = ['System', 'Custom (green)', 'Custom (red)'];
  themeArray: (CustomTheme | undefined)[] = [
    undefined, // System
    new PageCustomTheme(new GreenColors()),
    new PageCustomTheme(new RedColors())
  ]
  @State themeIndex: number = 0;

  build() {
    Column() {
      Column({ space: '8vp' }) {
        Button(`切换theme配色：${this.themeNames[this.themeIndex]}`)
          .onClick(() => {
            this.themeIndex = (this.themeIndex + 1) % UiComponentTextWithTheme03.themeCount;
          })
          .id('UiComponentTextWithTheme03')
        Text(`未使用WithTheme`)
        TextInput({ text: '未使用WithTheme', placeholder: 'input your word...', controller: this.controller })
      }
      .margin({
        top: '50vp'
      })
      WithTheme({ theme: this.themeArray[this.themeIndex] }) {
        Column({ space: '8vp' }) {
          Text(`使用WithTheme`)
          TextInput({ text: '使用WithTheme', placeholder: 'input your word...', controller: this.controller })
            .showUnderline(true);
        }
        .width('100%')
      }
    }
  }
}
