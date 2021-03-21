import Head from "next/head";
import styles from "../styles/Home.module.css";
import Link from "next/link";

export default function Home() {
  return (
    <div>
      <h1 className={styles.title}>Homepage</h1>
      <p className={styles.text}>
        Velit nulla est et aute velit anim est nisi ullamco commodo deserunt
        esse dolor incididunt. Adipisicing proident eiusmod id qui minim. Magna
        cupidatat quis non ad. Ullamco culpa eu esse amet et cupidatat laboris
        sit veniam.
      </p>
      <p className={styles.text}>
        Velit nulla est et aute velit anim est nisi ullamco commodo deserunt
        esse dolor incididunt. Adipisicing proident eiusmod id qui minim. Magna
        cupidatat quis non ad. Ullamco culpa eu esse amet et cupidatat laboris
        sit veniam.
      </p>
      <Link href="/ninjas"><a className={styles.btn}>See Ninja Listing</a></Link>
    </div>
  );
}
