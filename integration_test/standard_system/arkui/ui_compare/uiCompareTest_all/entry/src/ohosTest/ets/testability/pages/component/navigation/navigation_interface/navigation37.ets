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
import { LengthMetrics, TextModifier } from '@kit.ArkUI';

class MainTitleTextModfier extends TextModifier {
  public useStyle1: boolean = true;

  applyNormalAttribute(instance: TextModifier): void {
    if (this.useStyle1) {
      console.info(`testTag mainTitle use style1`);
      instance.fontColor('#FFFFC000');
      instance.fontSize(35);
      instance.fontWeight(FontWeight.Bolder);
      instance.fontStyle(FontStyle.Normal);
      instance.textShadow({ radius: 5, offsetX: 9 });
    } else {
      console.info(`testTag mainTitle use style2`);
      instance.fontColor('#FF23A98D');
      instance.fontSize(20);
      instance.heightAdaptivePolicy(TextHeightAdaptivePolicy.MIN_FONT_SIZE_FIRST);
      instance.fontWeight(FontWeight.Lighter);
      instance.fontStyle(FontStyle.Italic);
      instance.textShadow({ radius: 3, offsetX: 3 });
    }
  }
}

class SubTitleTextModfier extends TextModifier {
  public useStyle1: boolean = true;

  applyNormalAttribute(instance: TextModifier): void {
    if (this.useStyle1) {
      console.info(`testTag subTitle use style1`);
      instance.fontColor('#FFFFC000');
      instance.fontSize(15);
      instance.fontWeight(FontWeight.Bolder);
      instance.fontStyle(FontStyle.Normal);
      instance.textShadow({ radius: 5, offsetX: 9 });
    } else {
      console.info(`testTag subTitle use style2`);
      instance.fontColor('#FF23A98D');
      instance.fontSize(10);
      instance.fontWeight(FontWeight.Lighter);
      instance.fontStyle(FontStyle.Italic);
      instance.textShadow({ radius: 3, offsetX: 3 });
    }
  }
}

@Entry
@Component
export struct Navigation31 {
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  @State currentIndex: number = 0;
  @State paddingStart: LengthMetrics = LengthMetrics.vp(0);
  @State paddingEnd: LengthMetrics = LengthMetrics.vp(0);
  // 主标题样式修改器
  @State mainTitleModifier: MainTitleTextModfier = new MainTitleTextModfier();
  // 副标题样式修改器
  @State subTitleModifier: SubTitleTextModfier = new SubTitleTextModfier();
  @State applyModifier: boolean = false;
  @State useStyle1: boolean = true;
  @State commonTile: NavigationCommonTitle = {
    main: 'main',
    sub: 'sub'
  }

  @Builder
  NavigationTitle() {
    Column() {
      Text('Navigation31')
        .fontColor('#182431')
        .fontSize(30)
        .lineHeight(41)
        .fontWeight(700)
      Text('Navigation31')
        .fontColor('#182431')
        .fontSize(30)
        .lineHeight(41)
        .fontWeight(700)
      Text('Navigation31')
        .fontColor('#182431')
        .fontSize(30)
        .lineHeight(41)
        .fontWeight(700)
      Text('Navigation31')
        .fontColor('#182431')
        .fontSize(30)
        .lineHeight(41)
        .fontWeight(700)
    }.alignItems(HorizontalAlign.Center)
  }

  @Builder
  NavigationMenus() {
    Row() {
      Image('resources/base/media/icon.png')
        .width(24)
        .height(24)
      Image('resources/base/media/icon.png')
        .width(24)
        .height(24)
        .margin({ left: 24 })
    }
  }

  build() {
    Column() {
      Navigation() {
        List({ space: 12, initialIndex: 0 }) {
          ForEach(this.arr, (item: number) => {
            ListItem() {
              Text('' + item)
                .width('90%')
                .height(72)
                .backgroundColor('#FFFFFF')
                .borderRadius(24)
                .fontSize(16)
                .fontWeight(500)
                .textAlign(TextAlign.Center)
            }
          }, (item: number) => item.toString())
        }
        .id('nav37ScrollList')
        .height('50%')
        .width('100%')
        .margin({ top: 12, left: '10%' })
      }
      .height('100%')
      .title(
        { main: 'Title', sub: 'subTitle' },
        this.applyModifier ?
          {
            paddingStart: this.paddingStart,
            paddingEnd: this.paddingEnd,
            mainTitleModifier: this.mainTitleModifier,
            subTitleModifier: this.subTitleModifier,
          } : {
          paddingStart: this.paddingStart,
          paddingEnd: this.paddingEnd
        })
      .mode(NavigationMode.Auto)
      .menus(this.NavigationMenus)
      .titleMode(NavigationTitleMode.Free)
      .onTitleModeChange((titleModel: NavigationTitleMode) => {
        console.info('titleMode' + titleModel)
      })
    }.width('100%').height('100%').backgroundColor('#F1F3F5')
  }
}
