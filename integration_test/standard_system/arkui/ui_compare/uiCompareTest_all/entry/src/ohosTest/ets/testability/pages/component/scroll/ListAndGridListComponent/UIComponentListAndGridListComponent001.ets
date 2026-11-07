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
import { LengthMetrics, ComponentContent } from '@kit.ArkUI';


interface TimeTable {
  title: string;
  projects: string[];
}

class HeadBuilderParams {
  text: string | Resource;
  constructor(text: string | Resource) {
    this.text = text;
  }
}

class FootBuilderParams {
  num: number | Resource;
  constructor(num: number | Resource) {
    this.num = num;
  }
}

@Builder
function itemHead(params: HeadBuilderParams) {
  Text(params.text)
    .fontSize(20)
    .height('48vp')
    .width('100%')
    .padding(10)
    .backgroundColor($r('sys.color.background_tertiary'))
}

@Builder
function itemFoot(params: FootBuilderParams) {
  Text('共' + params.num + '节课')
    .fontSize(20)
    .height('48vp')
    .width('100%')
    .padding(10)
    .backgroundColor($r('sys.color.background_tertiary'))
}

@Entry
@Component
struct UIComponentListAndGridListComponent001 {
  @State headerNum: number = 0;
  @State footerNum: number = 0;
  @State settingMessage: string = '设置正常值时';
  @State timeTable: TimeTable[] = [
    {
      title: '星期一',
      projects: ['语文', '数学', '英语']
    },
    {
      title: '星期二',
      projects: ['物理', '化学', '生物']
    },
    {
      title: '星期三',
      projects: ['历史', '地理', '政治', '体育']
    },
    {
      title: '星期四',
      projects: ['美术', '音乐']
    }
  ];
  header?: ComponentContent<HeadBuilderParams> = undefined;
  footer?: ComponentContent<FootBuilderParams> = undefined;

  GetHeader(item: TimeTable) {
    let headerParam = new HeadBuilderParams(item.title);
    if(this.headerNum % 2 == 0) {
      this.header = new ComponentContent(this.getUIContext(), wrapBuilder(itemHead), headerParam);
    } else {
      this.header = undefined;
    }
    return this.header;
  }
  GetFooter(item: TimeTable) {
    let footerParam = new FootBuilderParams(item.projects.length);
    if(this.footerNum % 2 === 0) {
      this.footer = new ComponentContent(this.getUIContext(), wrapBuilder(itemFoot), footerParam);
    } else {
      this.footer = undefined;
    }
    return this.footer;
  }

  build() {
    Column() {
      Button('Test++')
        .id('Test++')
        .stateEffect(true)
        .width(100)
        .height(50)
        .onClick(() => {
          this.headerNum++;
          this.footerNum++;
          if((this.headerNum % 2 ===0) && (this.footerNum % 2 === 0)) {
            this.settingMessage = '设置正常值时';
          } else {
            this.settingMessage = '设置undefined时';
          }
        })
      Text(this.settingMessage)
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Green)
      List({ space: 20 }) {
        ForEach(this.timeTable, (item: TimeTable) => {
          ListItemGroup({
            headerComponent: this.GetHeader(item),
            footerComponent: this.GetFooter(item)
          }) {
            ForEach(item.projects, (project: string) => {
              ListItem() {
                Text(project)
                  .width('100%')
                  .height(100)
                  .fontSize(20)
                  .textAlign(TextAlign.Center)
              }
            }, (item: string) => item)
          }
          .divider({ strokeWidth: 1, color: Color.Blue })
        })

      }
      .layoutWeight(1)
      .sticky(StickyStyle.Header | StickyStyle.Footer)
      .scrollBar(BarState.Off)
    }
    .backgroundColor($r('sys.color.background_primary'))
  }
}