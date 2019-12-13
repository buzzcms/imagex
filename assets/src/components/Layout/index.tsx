import React, { ReactNode } from 'react'
import { Link } from 'react-router-dom'

export function Layout({ children }: { children: ReactNode }) {
  return (
    <div>
      <nav>
        <Link to="/login">Login</Link>
        <Link to="/buckets">Buckets</Link>
      </nav>
      <div>{children}</div>
    </div>
  )
}
