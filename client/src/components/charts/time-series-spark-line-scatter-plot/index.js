import React from 'react';

import { extent as d3ArrayExtent } from 'd3-array';
import {
  scaleLinear as d3ScaleLinear,
  scaleTime as d3ScaleTime,
} from 'd3-scale';
import { line as d3Line } from 'd3-shape';

import {
  axisBottom as d3AxisBottom,
  axisLeft as d3AxisLeft,
} from 'd3-axis';
import { select as d3Select } from 'd3-selection';

export default ({
  data,
  height,
  selectX,
  selectY,
  width,
}) => {
  const xScale = d3ScaleTime()
    .domain(d3ArrayExtent(data, selectX))
    .range([0, width]);

  const yScale = d3ScaleLinear()
    .domain(d3ArrayExtent(data, selectY))
    .range([height, 0]);

  // ADD:
  // Add an axis for our x scale which has half as many ticks as there are rows in the data set.
  const xAxis = d3AxisBottom()
      .scale(xScale)
      .ticks(data.length / 2);
  // Add an axis for our y scale that has 3 ticks (FIXME: we should probably make number of ticks per axis a prop).
  const yAxis = d3AxisLeft()
      .scale(yScale)
      .ticks(3);

  const selectScaledX = datum => xScale(selectX(datum));
  const selectScaledY = datum => yScale(selectY(datum));

  const sparkLine = d3Line()
    .x(selectScaledX)
    .y(selectScaledY);

  const linePath = sparkLine(data);

  return (
    <svg
      className="container"
      height={height}
      width={width}
    >
      <g className="xAxis" ref={node => d3Select(node).call(xAxis)} />
      <g className="yAxis" ref={node => d3Select(node).call(yAxis)} />

      <g className="line">
        <path d={linePath}/>
      </g>
    </svg>
  );
};