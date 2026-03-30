# Vercel Deployment Troubleshooting

Common issues and solutions for deploying Bella Restaurant on Vercel.

## Table of Contents

- [npm ci Errors](#npm-ci-errors)
- [Build Failures](#build-failures)
- [Node Version Issues](#node-version-issues)
- [Memory Issues](#memory-issues)
- [Timeout Issues](#timeout-issues)
- [Routing Issues](#routing-issues)
- [Environment Variables](#environment-variables)

## npm ci Errors

### Error: "npm ci" exited with 1

**Symptoms**:
```
npm error   --workspaces
npm error     Set to true to run the command in the context of **all** configured
npm error   --include-workspace-root
npm error     Include the workspace root when workspaces are enabled for a command.
npm error A complete log of this run can be found in: /vercel/.npm/_logs/...
Error: Command "npm ci" exited with 1
```

**Causes**:
- Workspace configuration issues
- Incompatible npm version
- Lock file corruption
- Node version mismatch

**Solutions**:

1. **Use npm install instead of npm ci**
   
   Update `vercel.json`:
   ```json
   {
     "installCommand": "npm install"
   }
   ```

2. **Specify Node version**
   
   Add to `vercel.json`:
   ```json
   {
     "nodeVersion": "20.x"
   }
   ```

3. **Clear npm cache**
   
   ```bash
   npm cache clean --force
   rm -rf node_modules package-lock.json
   npm install
   git add package-lock.json
   git commit -m "fix: update package-lock.json"
   git push
   ```

4. **Regenerate lock file**
   
   ```bash
   rm package-lock.json
   npm install
   git add package-lock.json
   git commit -m "fix: regenerate package-lock.json"
   git push
   ```

## Build Failures

### Error: "npm run build" failed

**Symptoms**:
```
Error: Command "npm run build" exited with 1
```

**Solutions**:

1. **Test build locally**
   
   ```bash
   npm run build:prod
   ```

2. **Check for TypeScript errors**
   
   ```bash
   npx tsc --noEmit
   ```

3. **Check for linting errors**
   
   ```bash
   npm run lint
   ```

4. **Verify all dependencies are installed**
   
   ```bash
   npm install
   npm run build:prod
   ```

5. **Update vercel.json build command**
   
   ```json
   {
     "buildCommand": "npm run build:prod"
   }
   ```

## Node Version Issues

### Error: Node version incompatibility

**Symptoms**:
```
Error: The specified Node version (18.x) is not available
```

**Solutions**:

1. **Specify compatible Node version in vercel.json**
   
   ```json
   {
     "nodeVersion": "20.x"
   }
   ```

2. **Or use .nvmrc file**
   
   Create `.nvmrc`:
   ```
   20.10.0
   ```

3. **Verify local Node version matches**
   
   ```bash
   node --version
   # Should be 20.x
   ```

## Memory Issues

### Error: "JavaScript heap out of memory"

**Symptoms**:
```
FATAL ERROR: CALL_AND_RETRY_LAST Allocation failed - JavaScript heap out of memory
```

**Solutions**:

1. **Increase Node memory in vercel.json**
   
   ```json
   {
     "buildCommand": "NODE_OPTIONS=--max-old-space-size=3072 npm run build:prod"
   }
   ```

2. **Optimize build process**
   
   - Remove unused dependencies
   - Check for large assets
   - Enable tree-shaking

3. **Update build command**
   
   ```bash
   NODE_OPTIONS=--max-old-space-size=4096 npm run build:prod
   ```

## Timeout Issues

### Error: Build timeout

**Symptoms**:
```
Error: Build timed out after 45 minutes
```

**Solutions**:

1. **Optimize build time**
   
   - Remove unnecessary dependencies
   - Optimize Angular build
   - Enable caching

2. **Check for slow operations**
   
   ```bash
   npm run build:prod -- --verbose
   ```

3. **Increase timeout in vercel.json**
   
   Note: Vercel has maximum timeout limits based on plan

4. **Parallel builds**
   
   - Split into multiple builds if possible
   - Use monorepo structure

## Routing Issues

### Error: 404 on page refresh

**Symptoms**:
- SPA routes return 404
- Direct URL access fails
- Only root path works

**Solutions**:

1. **Verify rewrites in vercel.json**
   
   ```json
   {
     "rewrites": [
       {
         "source": "/(.*)",
         "destination": "/index.html"
       }
     ]
   }
   ```

2. **Check Angular routing**
   
   Ensure `app.routes.ts` has proper routes:
   ```typescript
   export const routes: Routes = [
     { path: '', component: HomeComponent },
     { path: 'menu', component: MenuComponent },
     { path: '**', redirectTo: '' }
   ];
   ```

3. **Verify build output**
   
   Check that `dist/resturent/index.html` exists

## Environment Variables

### Error: Environment variables not loading

**Symptoms**:
- Variables undefined in application
- API calls fail
- Configuration missing

**Solutions**:

1. **Add to Vercel dashboard**
   
   - Go to Project Settings → Environment Variables
   - Add variables for each environment
   - Redeploy after adding

2. **Verify in vercel.json**
   
   ```json
   {
     "env": {
       "NODE_ENV": "production",
       "API_BASE_URL": "@api-base-url"
     }
   }
   ```

3. **Check environment variable access**
   
   In Angular, use:
   ```typescript
   const apiUrl = import.meta.env.VITE_API_BASE_URL;
   ```

4. **Rebuild after changes**
   
   Environment variables require rebuild to take effect

## Debugging

### Enable verbose logging

```bash
# Local build with verbose output
npm run build:prod -- --verbose

# Check Vercel logs
vercel logs --follow
```

### Check Vercel build logs

1. Go to Vercel dashboard
2. Select project
3. Go to Deployments
4. Click on failed deployment
5. View build logs

### Common log patterns

```
# Success
✓ Build completed
✓ Deployment successful

# Failure
✗ Build failed
✗ npm ci failed
✗ Build timed out
```

## Prevention

### Best practices

1. **Test locally before pushing**
   
   ```bash
   npm run build:prod
   npm run lint
   npm test
   ```

2. **Keep dependencies updated**
   
   ```bash
   npm update
   npm audit fix
   ```

3. **Monitor build times**
   
   - Track build duration
   - Optimize slow builds
   - Profile bundle size

4. **Use proper configuration**
   
   - Maintain vercel.json
   - Set correct Node version
   - Configure environment variables

5. **Regular testing**
   
   - Test on staging first
   - Verify all routes work
   - Check API connectivity

## Getting Help

### Resources

- [Vercel Documentation](https://vercel.com/docs)
- [Vercel Support](https://vercel.com/support)
- [Angular Build Guide](https://angular.io/guide/build)
- [GitHub Issues](https://github.com/Mostafa-SAID7/Bella/issues)

### Report Issues

1. Check existing issues
2. Provide error logs
3. Include reproduction steps
4. Share vercel.json configuration

---

Last updated: March 2026
