import Head from "next/head";
import styles from "../styles/Home.module.css";
import Navbar from "../components/Navbar";
import Footer from "../components/Footer";
import Link from "next/link";

export default function Home() {
  return (
    <div>
      <Navbar />
      <h1>Homepage</h1>
      <p>
        Velit nulla est et aute velit anim est nisi ullamco commodo deserunt
        esse dolor incididunt. Adipisicing proident eiusmod id qui minim. Magna
        cupidatat quis non ad. Ullamco culpa eu esse amet et cupidatat laboris
        sit veniam.
      </p>
      <p>
        Velit nulla est et aute velit anim est nisi ullamco commodo deserunt
        esse dolor incididunt. Adipisicing proident eiusmod id qui minim. Magna
        cupidatat quis non ad. Ullamco culpa eu esse amet et cupidatat laboris
        sit veniam.
      </p>
      <Link href="/ninjas"><a>See Ninja Listing</a></Link>
      <Footer />
    </div>
  );
}
