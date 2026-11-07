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
import { common2D, drawing } from '@kit.ArkGraphics2D';

@Entry
@Component
struct UIComponentMediaImageReset0039 {
  @State name: string = 'UIComponentMediaImageReset0039';
  @State message: string = 'UIComponentMediaImageReset0039';
  @State imageSrcIndex: number = 0;
  @State imageSrcList: (ResourceStr | ImageContent)[] = ['/images/app_icon.png', ImageContent.EMPTY];
  @State DrawingColorFilterFirst: ColorFilter | undefined = undefined;
  private color: common2D.Color = { alpha: 255, red: 255, green: 0, blue: 0 };

  build() {
    Column() {
      Text(this.message)
        .margin(10)

      Image(this.imageSrcList[this.imageSrcIndex])
        .onComplete((event) => {
          this.message += '\n image onComplete, width: ' + event?.width + ', height: ' + event?.height;
        })
        .onError((error: ImageError) => {
          this.message += '\n image onError, err: ' + JSON.stringify(error);
        })
        .colorFilter(this.DrawingColorFilterFirst)
        .id(this.name + '_01')
        .width(50)
        .height(50)

      Button('设置颜色滤镜后ImageContent.EMPTY')
        .onClick(() => {
          let darkMode = uiAppearance.getDarkMode();
          if (darkMode === 0) {
            this.message += '\nCurrent dark-mode is: ALWAYS_DARK';
          } else if (darkMode === 1) {
            this.message += '\nCurrent dark-mode is: ALWAYS_LIGHT';
          } else {
            this.message += '\nCurrent dark-mode is: unknown';
          }
          this.DrawingColorFilterFirst = drawing.ColorFilter.createBlendModeColorFilter(this.color, drawing.BlendMode.SRC_IN);
          this.imageSrcIndex = (this.imageSrcIndex + 1) % this.imageSrcList.length;
        })
        .id(this.name + '_02')
        .margin(10)

    }
    .width('100%')
    .height('100%')
  }
}
