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
import { uiAppearance } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct UIComponentSymbolGlyphFontSizeScale0010 {
  @State name: string = 'UIComponentSymbolGlyphFontSizeScale0010';
  @State message: string = 'message';

  onPageShow(): void {
    try {
      let currentFontScale = uiAppearance.getFontScale();
      this.message = `currentFontScale: ${currentFontScale}`;
    } catch (paramErr) {
      this.message = `Get fontScale failed. paramErr: ${JSON.stringify(paramErr)}, ${paramErr.message}`;
    }
  }

  build() {
    Column() {
      Row() {
        Column() {

          SymbolGlyph($r('sys.symbol.ohos_wifi'))
            .fontSize(30)
            .minFontScale(1)
            .maxFontScale(2)
            .margin({bottom: 10})

          Text(this.message)
            .fontSize(30)
            .margin({bottom: 10})

          Button('系统调节字体大小为0.5')
            .id(this.name + '_01')
            .onClick(() => {
              let fontScale = 0.5;
              try {
                uiAppearance.setFontScale(fontScale).then(() => {
                  this.message = `Set fontScale successfully as ${fontScale}.`
                }).catch((err: Error) => {
                  this.message = `Set fontScale failed. err: ${JSON.stringify(err)}, ${err.message}`;
                });
              } catch (paramErr) {
                this.message = `Set fontScale failed. paramErr: ${JSON.stringify(paramErr)}, ${paramErr.message}`;
              }
            })
            .margin({bottom: 10, top: 10})

          Button('系统调节字体大小为1.5')
            .id(this.name + '_02')
            .onClick(() => {
              let fontScale = 1.5;
              try {
                uiAppearance.setFontScale(fontScale).then(() => {
                  this.message = `Set fontScale successfully as ${fontScale}.`
                }).catch((err: Error) => {
                  this.message = `Set fontScale failed. err: ${JSON.stringify(err)}, ${err.message}`;
                });
              } catch (paramErr) {
                this.message = `Set fontScale failed. paramErr: ${JSON.stringify(paramErr)}, ${paramErr.message}`;
              }
            })
            .margin({bottom: 10})

          Button('系统调节字体大小为3')
            .id(this.name + '_03')
            .onClick(() => {
              let fontScale = 3;
              try {
                uiAppearance.setFontScale(fontScale).then(() => {
                  this.message = `Set fontScale successfully as ${fontScale}.`
                }).catch((err: Error) => {
                  this.message = `Set fontScale failed. err: ${JSON.stringify(err)}, ${err.message}`;
                });
              } catch (paramErr) {
                this.message = `Set fontScale failed. paramErr: ${JSON.stringify(paramErr)}, ${paramErr.message}`;
              }
            })
            .margin({bottom: 10})

        }.margin({ right: 20 })
      }
    }.margin({
      left: 30,
      top: 50
    })
  }
}
