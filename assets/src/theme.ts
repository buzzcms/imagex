import { SxStyleProp } from 'theme-ui'

export const colors = {
  primary: '#195190',
  text: '#000',
  background: '#fff',
  'light-gray': '#f2f2f2',
  'white-20': 'rgba(255, 255, 255, 0.2)',
  'white-50': 'rgba(255, 255, 255, 0.5)',
  'black-20': 'rgba(0, 0, 0, 0.2)',
}

export const theme = {
  fontFamily: {
    raised: 'Montserrat, sans-serif;',
  },
  borders: {
    light: `rgba(0, 0, 0 , 0.1) 1px solid`,
    medium: `${colors.primary} 2px solid`,
  },
  fontSizes: [
    '0.5rem',
    '0.625rem',
    '0.75rem',
    '1rem',
    '1.25rem',
    '1.5rem',
    '2rem',
  ],
  shadows: {
    light: `1px 1px 1px 1px rgba(0, 0, 0, 0.1)`,
  },
  colors,
}

export const listPageSx: SxStyleProp = {
  display: 'grid',
  height: '100%',
  '#breadcrumb': { gridArea: 'breadcrumb' },
  '#toolbar': { gridArea: 'toolbar' },
  '#table': { gridArea: 'table' },
  '#filter': { gridArea: 'filter' },
  gridGap: '16px',
  gridTemplateAreas: [`'breadcrumb' 'toolbar' 'filter' 'table'`],
  gridTemplateRows: 'auto auto auto minmax(0, 1fr)',
}

export const absoluteFillSx = {
  position: 'absolute',
  top: 0,
  right: 0,
  bottom: 0,
  left: 0,
}

export const flexCenterSx = {
  display: 'flex',
  alignItems: 'center',
}

export const ellipsisSx = {
  display: 'block',
  whiteSpace: 'nowrap',
  textOverflow: 'ellipsis',
  overflow: 'hidden',
}
